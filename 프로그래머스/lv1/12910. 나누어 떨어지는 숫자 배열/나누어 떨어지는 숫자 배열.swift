func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let newArr = arr.filter { $0 % divisor == 0 }
    return newArr.isEmpty ? [-1] : newArr.sorted()
}