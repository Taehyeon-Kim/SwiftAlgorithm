/// 트리 노드
class Node {
  var val: Int
  var left: Node?
  var right: Node?

  init(_ val: Int) {
    self.val = val
  }
}

// solution
let tc = Int(readLine()!)!
for _ in 0..<tc {
  let n = Int(readLine()!)!
  let preorder = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let inorder = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  var ret = [Int]()

  func solution(_ root: Int, _ start: Int, _ end: Int) {
    for i in stride(from: start, to: end, by: 1) {
      if inorder[i] == preorder[root] {
        solution(root + 1, start, i)
        solution(root + 1 + i - start, i + 1, end)
        ret.append(preorder[root])
      }
    }
  }
  
  solution(0, 0, n)
  print(ret.map{String($0)}.joined(separator: " "))
}