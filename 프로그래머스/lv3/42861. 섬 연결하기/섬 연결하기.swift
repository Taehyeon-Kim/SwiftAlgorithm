import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var tuple = costs
    tuple.sort(by: { $0[2] < $1[2] })
    
    var p = [Int]()
    for i in 0..<n+1 {
        p.append(i)
    }
    
    func findParent(_ v: Int) -> Int {
        if p[v] == v { return v }
        p[v] = findParent(p[v])
        return p[v]
    }
    
    func union(_ u: Int, _ v: Int) -> Bool {
        let u = findParent(u)
        let v = findParent(v)
        
        if u == v { return false }
        else { p[v] = u }
        return true
    }
    
    func kruskcal() -> Int {
      var (ret, edges) = (0, 0)

      for value in tuple {
        var (u, v, cost) = (value[0], value[1], value[2])
        if union(u, v) {
          ret += cost
          edges += 1
          if edges == n - 1 {
            return ret
          }
        }
      }
      return -1
    }

    return kruskcal()
}