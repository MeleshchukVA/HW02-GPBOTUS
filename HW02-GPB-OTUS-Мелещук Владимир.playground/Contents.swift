import UIKit

// MARK: - Задание 1.
// Есть произвольный массив чисел, найти максимальное и минимальное число и поменять их местами.

// Функция генерирует массив случайных чисел в диапазоне от 1 до 15.
// Количество элементов задаем самостоятельно.
func createRandomIntArray(_ n: Int) -> [Int] {
    return (0..<n).map { _ in Int.random(in: 1 ... 15) }
}

// Создаем массив из 5 случайных чисел.
var randomArray = createRandomIntArray(5)

extension Collection where Element: Comparable {
    // Функция ищет индекс максимального элемента.
    func firstIndexOfMaxElement() -> Index? {
        zip(indices, self).max(by: { $0.1 < $1.1 })?.0
    }
    
    // Функция ищет индекс минимального элемента.
    func firstIndexOfMinElement() -> Index? {
        zip(indices, self).min(by: { $0.1 < $1.1 })?.0
    }
}

let minIndex = randomArray.firstIndexOfMinElement()
let maxIndex = randomArray.firstIndexOfMaxElement()

// Меняем местами минимальный и максимальный элементы массива.
randomArray.swapAt(minIndex ?? 0, maxIndex ?? 0)


// MARK: - Задание 2.
// Есть два массива символов - собрать результирующее множество из символов, что повторяются в 2х массивах.

// Используем созданную в задании 1 функцию createRandomArray() для генерации двух случайных массивов чисел.
let firstRandomArray = createRandomIntArray(5)
let secondRandomArray = createRandomIntArray(5)

// Повторяющиеся символы в двух массивах добавляем в новый массив.
let commonArray = firstRandomArray.filter { number in
    secondRandomArray.contains(number)
}

print(commonArray)


// MARK: - Задание 3.
// Создать словарь с соотношением имя пользователя (ключ) - пароль (значение),
// получить из словаря все имена, пароли которых длиннее 10 символов.

// Словарь.
let dict: [String : String] = [ "Joe" : "13371337",
                                "Barak" : "228420",
                                "Michele" : "88005553535",
                                "Vladimir" : "15551555vm",
                                "Andrew" : "kmflksfjkljfklfll"]

// Пустой массив, где будут храниться логины.
var arrayOfLogins: [String] = []

for (login, password) in dict {
    // Если длина пароля больше 10 символов,
    // то добавляем логин в массив arrayOfLogins.
    if password.count > 10 {
        arrayOfLogins.append(login)
    }
}

print(arrayOfLogins)
