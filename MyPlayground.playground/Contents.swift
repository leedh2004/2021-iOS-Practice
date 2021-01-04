import UIKit

var str = "Hello, playground"

let value = arc4random_uniform(100)
print("--> \(value)")

// --- Tuple
let coord = (4, 6)
let x = coord.0
let y = coord.1
// 0, 1은 이름이 너무 이상한데?
// 해결법
let coordName = (x:2, y:3)
let x2 = coordName.x
let y2 = coordName.y
let (x3, y3) = coordName
x3
y3

// --- Boolean
let yes = true
let no = false

let fourIsGreaterthanFive = 4 > 5 ? yes : no

var i = 0
while i < 10 {
    print(i)
    i += 1
}
i = 10
// repeat의 경우 코드 수행 > 조건 임
repeat {
    print(i)
    i += 1
} while i < 10

// --- For Loop
let closedRange = 0...10 // 0 ~ 10
let halfClosedRange = 0..<10 // 0 ~ 9
var sum = 0
for i in closedRange {
    print("--> \(i)")
}

import Foundation
var sinValue : CGFloat = 0
for _ in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

for i in closedRange where i % 2 == 0 {
    print("--> 짝수: \(i)")
}

// switch
let num = 10
switch num {
case 0...10:
    print("--> 0 ~ 10입니다")
case 11:
    print("--> 11입니다")
    
default:
    print("나머지 입니다")
}

switch num {
case _ where num % 2 == 0:
    print("--> 짝수")
default:
    print("--> 홀수")
}

let pet = "bird"
switch pet {
case "dog", "cat", "bird":
    print("집 동물이네요")
default:
    print("잘 모르겟습니다")
}

switch coord{
case(0, 0):
    print("---> 원점이네요")
case(_, 0):
    print("---> x축 이네요")
case(0, let y):
    print("---> y축 이네요, y:\(y)")
case(let x, let y) where x == y:
    print("x랑 y랑 같음 = \(x), \(y)")
case(let x, let y):
    print("좌표 어딘가 x,y = \(x), \(y)")
}

func printTotalPrice(price: Int, count: Int){
    print("Tot")
}
printTotalPrice(price: 20, count: 20)

func printTotalPrice2(_ price: Int = 1500, 갯수 count: Int){
    print("\(price) \(count)")
}
printTotalPrice2(20, 갯수:20)
printTotalPrice2(갯수:20)

func totalPrice(price: Int, count: Int) -> Int {
    return price * count
}

totalPrice(price: 10000, count: 20)

var values = 3
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
incrementAndPrint(&values)

// --- Function as a param
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var function = add
function(4, 2)

func printResult(_ funct:(Int, Int) -> Int, _ a: Int, _ b: Int){
    print(funct(a, b))
}
printResult(add, 3, 5)

var carName: String?
carName = nil
carName = "탱크"
// 옵셔널 고급기능 4가지
// Forced unwrapping > 억지로 박스를 까보자
// Optional binding (if let) > 부드럽게 박스를 까보자 1
// Optional binding (guard) > 부드럽게 박스를 까보자 2
// Nil coalescing > 박스를 까봤더니, 값이 없으면 디폴트 값을 줘보자
print(carName)
print(carName!)
carName = nil
if let unwrappedCarName = carName{
    print(unwrappedCarName)
}else{
    print("Car Name 없다")
}
func printParsedInt(from: String){
    if let parsedInt = Int(from){
        print(parsedInt)
    }else{
        print("Int로 컨버팅 안된다.")
    }
}
printParsedInt(from: "100")
printParsedInt(from: "zzz")
// if let 의 경우 depth가 깊어짐. 이를 싸이클로어쩌구라고 부르는데 이게 커지면 코드를 리팩토링해야함
// 이 경우 guard 를 사용하면 depth가 깊어지지않음.
func printguardParsedInt(from: String){
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안된다.")
        return
    }
    print(parsedInt)
}
printguardParsedInt(from: "1002")

// carName이 nil이면 default 값을 넣는다는 의미이다.
let myCarName: String = carName ?? "모델 S"

var myFavoriteFood : String? = nil
if let my = myFavoriteFood {
    print(my)
}else{
    print("nil이야 임마")
}
func printNickname(_ nick:String?){
    guard let val = nick else {
        print("nil이야 임마2")
        return
    }
    print(nick)
}

printNickname("도도킹")
printNickname(nil)

// Array
// let 으로 선언하면 추가는 안됨.
var eventNumbers: [Int] = [2, 4, 6, 8]
eventNumbers.append(10)
eventNumbers += [12, 14, 16]
eventNumbers.append(contentsOf: [18, 20])
if !eventNumbers.isEmpty {
    print("Not EMPTY! count: \(eventNumbers.count)")
}
let firstItem = eventNumbers.first
let firstThree = eventNumbers[0...2]
eventNumbers.contains(3)
eventNumbers.contains(4)
eventNumbers.insert(0, at: 0)
eventNumbers.removeAll()
//eventNumbers.swapAt(0, 9)
eventNumbers = [-2, 0, 2]
for num in eventNumbers {
    print(num)
}
for (index, num) in eventNumbers.enumerated() {
    print("idx \(index) value: \(num)")
}
eventNumbers.dropFirst(3) // 배열자체에 영향을 주지 않고 뺀 나머지를 리턴함
eventNumbers.dropLast(3)
eventNumbers.prefix(3)
eventNumbers.suffix(3)

//Dictionary (Key, Value)
//값을 의미단의로 찾을 때 편함

var scoreDic: [String: Int] = ["Jason":80, "Jay":95, "Jake": 90]
//var scoreDic: Dictionary<String: Int> = ["Jason":80, "Jay":95, "Jake": 90]
scoreDic["Dohyun"]
if let score = scoreDic["Jason"] {
    score
}else{
    // ..score 없음
}
scoreDic.isEmpty
scoreDic.count
// 업데이트
scoreDic["Jason"] = 99
// 추가
scoreDic["NewPeople"] = 100
// 제거
scoreDic["NewPeople"] = nil
scoreDic
// 순회
// dictionary는 순서가 없다고 봐야 함.
for (name, score) in scoreDic {
    print("\(name) \(score)")
}
for key in scoreDic.keys {
    print(key)
}
var myDic: [String: String] = ["name":"Dohyun","job":"iOS Engineer", "city":"Seoul"]
func printNameAndCity(dic:[String:String]){
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    }else{
        print("Can't find")
    }
}
printNameAndCity(dic: myDic)

// Set
var someSet: Set<Int> = [1,2,3,1]
someSet.isEmpty
someSet.count
someSet.contains(1)

// Closure
//var multiplyClosure: (Int, Int) -> Int = { (a: Int, b:Int) -> Int in
//    return a * b
//}
// 이렇게 줄일 수 있다.
//var multiplyClosure: (Int, Int) -> Int = { a,b in
//    return a * b
//}
var multiplyClosure: (Int, Int) -> Int = { $0 * $1 }
multiplyClosure(4,2)
// 너무 심하게 줄이는 건 의미 파악이 어려우므로 위에있는 주석만큼 줄이는 걸 추천
func operateTwoNum(a:Int, b:Int, operation:(Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}
operateTwoNum(a: 3, b: 5, operation: multiplyClosure)
var addClosure: (Int, Int) -> Int = {a, b in
    return a + b
}
operateTwoNum(a: 3, b: 5, operation: addClosure)
operateTwoNum(a: 4, b: 2) { $0 / $1 }

let voidClosure: () -> Void = {
    print("iOS 개발자, 클로져 사랑해")
}
voidClosure()

// 클로저에 잡힌(capture) 변수는 scope에 벗어나도 계속 사용가능하다.
// capture the value
var count = 0
let incrementer = {
    count += 1
}
incrementer()
incrementer()
incrementer()
count

// Closure Syntax
/*
 { (param) -> return type in
    statement...
 }
 
 */
// Example: 1
let choSimpleClosure = {}
choSimpleClosure()

// Example: 2
let choSimpleClosure2 = {
    print("Hello, 클로저")
}
choSimpleClosure2()

// Example: 3
let choSimpleClosure3: (String) -> Void = { name in
    print("나의 이름은 \(name)입니다!")
}
choSimpleClosure3("이도현")

// Example: 4
let choSimpleClosure4: (String) -> String = { name in
    let message = "\(name)님 안녕하세요"
    return message
}
choSimpleClosure4("홍길동")

// Example: 5
func someSimpleFunc(choSimpleClosure: () -> Void){
    print("함수 호출이 되었어요")
    choSimpleClosure()
}
someSimpleFunc(choSimpleClosure: {
    print("헬로 코로나 from closure")
})

// Example 6: Trailing Closure
// 클로저가 인자의 제일 마지막인 경우
someSimpleFunc(){
    print("헬로 코로나!!")
}

// Structure
struct Location {
    let x:Int
    let y:Int
}

struct Store {
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}

let store1 = Store(loc:Location(x:3, y:5), name:"gs") // 튜플임.
let store2 = Store(loc:Location(x:4, y:6), name:"seven")
let store3 = Store(loc:Location(x:1, y:7), name:"cu")
let myLocation = Location(x:2, y:2)
let stores = [store1, store2, store3]

func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(current.x - target.x)
    let distanceY = Double(current.y - target.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

func printClosestStore(currentLocation:Location, stores:[Store]){
    var closestStoreName = ""
    var closestStoreDist = Double.infinity
    var isDeliverable = false
    for store in stores{
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        closestStoreDist = min(closestStoreDist, distanceToStore)
        if closestStoreDist == distanceToStore {
            closestStoreName = store.name
            isDeliverable = store.isDeliverable(userLoc: currentLocation)
        }
    }
    print("Closest store: \(closestStoreName), deliverable: \(isDeliverable)")
}

printClosestStore(currentLocation: myLocation, stores: stores)

struct Lecture: CustomStringConvertible{
    var description: String {
        return "Title \(lecName), Teacher: \(teacher)"
    }
    let lecName:String
    let teacher:String
    var memberCnt:Int = 0
    var maxStudents: Int = 10
    // method
    func remainSeats() -> Int {
        return maxStudents - memberCnt
    }
    // property를 변형시키는 함수의 경우 함수 좌측에 mutating을 붙여야 함.
    mutating func register() {
        // 등록된 학생수 증가시키기
        memberCnt += 1
    }
    // type property
    static let target:String = "Anybody want to learn something"
    
    // type method
    static func location() -> String {
        return "Seoul"
    }
}

var lec1 = Lecture(lecName: "확통", teacher: "이상화")
let lec2 = Lecture(lecName: "인지", teacher: "노영균")
let lec3 = Lecture(lecName: "데베시", teacher: "김상욱")
lec1.register()
lec1.register()
lec1.remainSeats()
Lecture.location()
Lecture.target
let lecs = [lec1, lec2, lec3]

func printLecName(from teacher:String, lecs:[Lecture]){
//    for lec in lecs{
//        if teacher == lec.teacher {
//            print(lec.lecName)
//        }
//    }
//    let lectureName = lecs.first{ (lec) -> Bool in
//        return lec.teacher == teacher
//    }?.lecName ?? "존재하지않음"
    
    let lectureName = lecs.first{ $0.teacher == teacher }?.lecName ?? "존재하지않음" // first는 첫번째로 만족하는 원소를 반환
    print(lectureName)
}


printLecName(from:"이상화", lecs: lecs)
printLecName(from:"이상화2", lecs: lecs)

struct Person {
    var firstName: String {
        // didSet은 stored Property에만 가능.
        // 바뀐 시점을 알 수 있다.
        willSet{
            print("willSet: --> \(firstName)")
        }
        didSet{
            print("didSet: --> \(firstName)")
        }
    }
    var lastName: String
    // computed Property의 경우 var 키워드만 가능함.
    // computed Property는 read only임
    // 셋팅을 가능하게 하려면, getter, setter를 설정해야 함.
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            if let firstName = newValue.components(separatedBy: " ").first{
                self.firstName = firstName
            }
            if let lastName = newValue.components(separatedBy: " ").last{
                self.lastName = lastName
            }
        }
    }
    // computed Property 밑의 함수와 무엇이 다른가?
    //
//    func fullName() -> String {
//        return "\(firstName) \(lastName)"
//    }
    
    // type property (객체와 상관없이 사용)
    static let isAlien  = false
    
    // lazy property (접근이 되었을 때 실행됨)
    lazy var isPopular: Bool = {
        if fullName == "Jay Park"{
            return true
        }else{
            return false
        }
    }()
}
var person = Person(firstName: "Dohyun", lastName: "Lee")
person.fullName
person.fullName = "Jay Park"
Person.isAlien
person.isPopular

struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        }else {
            return -value
        }
    }
}
Math.abs(value: -20)

// 확장
extension Int {
    func square() -> Int {
        return self * self
    }
    func half() -> Int {
        return self / 2
    }
}
var val: Int = 3
val.square()
val.half()
 
// Class
// reference Type임

//클래스의 경우 mutating function이 없다
class PersonClass {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}
var personClass1 = PersonClass(firstName: "Dohyun", lastName: "Lee")
// 일단 Struct로 쓰고, 클래스로 바꿀 필요가 있을 때 Class로 바꿈

//상속
// class Student: Person {
//  var grades: [Grade] = []
//}
// override는 자식이 부모에 있는 메소드를 자식클래스에 만드는 것임.
// upper casting
// down casting

