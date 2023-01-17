import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var sets = Set<[Int]>()

    func dfs(_ index: Int, _ arr: [Int]) {
        if index == numbers.count {
            sets.insert(arr)
            return 
        }
        
        for val in [numbers[index], -numbers[index]] {
            let elem = arr + [val]
            dfs(index + 1, elem)
        }
    }

    dfs(0, [])
    return sets.filter { $0.reduce(0, +) == target }.count
}