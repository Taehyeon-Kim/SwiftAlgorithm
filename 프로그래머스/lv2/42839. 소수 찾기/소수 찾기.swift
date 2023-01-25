import Foundation

func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var visited = Array(repeating: false, count: array.count)

    func cycle(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }

    cycle([])

    return result
}

func isPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    
    for i in 2..<n {
        if n % i == 0 { return false }
    }
    return true
}

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map{String($0)}
    var sets = Set<Int>()
    for i in 1...numbers.count {
        let elem = permutation(numbers, i).map { $0.joined() }.map { Int($0)! }
        elem.forEach { sets.insert($0) }
    }

    return sets.filter { isPrime($0) }.count
}