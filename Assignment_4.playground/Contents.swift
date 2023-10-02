import Foundation

//შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.


func factorial (number: Int) -> (Int) {
    
    if number < 0 {
        print("the factorial of a negative number is not defined")
        return -1
        // აქ return ის გარეშე არ მაშვებინებდა და უბრალოდ დავაბრუნებინე რაღაც
    } else if number == 0 || number == 1 {
        print("\(number)! = 1")
        return 1
    } else {
        var temp = 1
        for i in 2...number {
            temp *= i
        }
        print("\(number)! = \(temp)")
        return temp
    }
}

factorial(number: 8)


//შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.

func fibonacci () -> ([Int]) {
    var numbers: [Int] = [0, 1]
    
    var firstNum = 0
    var secondNum = 1
    
    var temp = 0
    
    for _ in 0..<18 {
        temp = firstNum
        firstNum = secondNum
        secondNum = temp + firstNum
        numbers.append(secondNum)
        
    }
    print(numbers)
    return numbers
}

fibonacci()


//შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.

func reversedString (string: String) -> (Bool) {
    
    var reversedString = ""

    for char in string {
        reversedString = String(char) + reversedString
    }
    
    print(reversedString == string ? "მოცემული სიტყვა პალინდრომია" : "მოცემული სიტყვა არ არის პალინდრომი")
    return reversedString == string
}

reversedString(string: "racecar")



//შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.


func squareNumbers (array: [Int]) -> ([Int]) {
    var squaredArray: [Int] = []
    var tempNum = 0
    for i in array {
        tempNum = i*i
        squaredArray.append(tempNum)
    }
    
    print(squaredArray)
    return squaredArray
}

squareNumbers(array: [2, 3, 4, 5])


//შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]



func stringToDictionary(string: String) -> [String: Int] {
    var wordsDict: [String: Int] = [:]
    
    let separators = CharacterSet(charactersIn: " ,.")
    
    let arrayFromString = string.components(separatedBy: separators)
    
    arrayFromString.compactMap {$0}
    
    for word in arrayFromString {
        word.lowercased()
        wordsDict[word, default: 0] += 1
    }
    
    print(wordsDict)
    return wordsDict
}

stringToDictionary(string: "string I am planning to use for some project, at some point, I hope it will work")



//შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.


let binaryNumber: (Int) -> String = { decimal in

    var binaryString = ""
    var num = decimal

        while num > 0 {
            binaryString = String(num % 2) + binaryString
            num /= 2
        }

    return binaryString
}

print(binaryNumber(8))



//შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.


let oddNumberSlayer: ([Int]) -> [Int] = { array in
    var newArray = array
    var index = 0
    
    while index < newArray.count {
           if newArray[index] % 2 != 0 {
               newArray.remove(at: index)
           } else {
               index += 1
           }
       }
    
    return newArray
}

var arrayToFilter = [1, 2, 3, 4, 5, 6]


print(oddNumberSlayer(arrayToFilter))


//შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.


var numbersToMultiply = [1, 2, 3, 4, 5]

let multiplyBy10: (Int) -> Int = { number in
    return number * 10
}

let multipliedNumbers = numbersToMultiply.map(multiplyBy10)

print(multipliedNumbers)


//გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.

let arrayForClosure = [2, 4, 5, 6, 7, 8, 23]

let escapingClosure: ([Int]) -> () = { array in
    var sum = 0
    for i in array {
        sum += i
    }
    print(sum)
}


DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
    escapingClosure(arrayForClosure)
}



//function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.

func stringToOddNumbers (array: [String]) -> ([Int]) {
    var newArray = array.compactMap({ string in Int(string) })
    
    return newArray.filter({$0.isMultiple(of: 2) == false})
}

stringToOddNumbers(array: ["1", "cat", "3", "4", "something", "5", "6"])
