# SwiftAlgorithm

## Tips and comment

- WIP

## Data Structure

- Array
- Set
- Tuple
- Dictionary, Hash Map
- Linked List
- Stack
- Queue
- Tree
- Graph

### [Heap(힙)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/32)

- peek(min, max value) - O(1)
- append, pop - O(logN)

```swift
import Foundation

struct Heap<T: Comparable> {
    var nodes = [T]()
    let sort: (T,T) -> Bool

    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        nodes.isEmpty
    }

    mutating func append(_ element: T) {
        var index = nodes.count // 마지막 인덱스
        nodes.append(element)

        // shift up
        while index > 0, sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func pop() -> T? {
        if nodes.isEmpty { return nil }

        // 루트 노드 pop
        let result = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        nodes.popLast()

        var index = 0

        // shift down
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            let children = [left, right]
                .filter { $0 < nodes.count && sort(nodes[$0], nodes[index]) }
                .sorted { sort(nodes[$0], nodes[$1]) }

            if children.isEmpty { break }

            nodes.swapAt(index, children[0])
            index = children[0]
        }

        return result
    }
}

extension Heap {
    init() {
        self.init(sort: <)
    }
}

var heap = Heap<Int>()
heap.append(4)
heap.append(2)
heap.append(3)
heap.append(1)

heap.pop()
heap.pop()
heap.pop()
heap.pop()
heap.pop()
```

- Binary Search Tree

## Algorithm

- Recursion(재귀, 귀납적 사고의 중요성)
- Brute Force
- Backtracking
- Binary Search
- Greedy
- BFS/DFS
- Dynamic Programming
- Sliding Window
- Two Pointers
- Prefix Sum

### Graph

- 인접 행렬, 인접 리스트
- BFS/DFS
- 위상정렬

#### Shortest path problem

- BFS
### [Dijkstra(다익스트라)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/33)

> 방향 또는 무방향 그래프에서 하나의 시작점으로부터 다른 모든 정점까지의 최단 거리를 구하는 알고리즘  
> 힙을 이용해서 구현한 다익스트라 알고리즘은 O(ElogE = ElogV)의 시간복잡도를 가짐

- **최소** 힙/우선순위 큐 사용해서 구현
- 비용(거리)와 정점을 헷갈리지 말기
- 큐에서 뽑는 원소와 테이블을 비교하는 과정 체크(뽑는 원소의 거리가 테이블에 있는 값과 다르다면 skip)

```swift
let ve = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (v,e) = (ve[0], ve[1])    // 정점 개수(V^2 - 400,000,000), 간선 개수(300,000)
let start = Int(readLine()!)! // 시작 정점

let inf = Int.max
var d = [Int](repeating: inf, count: v+1)  // 거리 배열(d, dist, distance)
var adj = Array(repeating: [(Int,Int)](), count: v+1)
var q = Heap<Pair>()

// 방향 그래프 u -> (w) -> v
for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (u,v,w) = (uvw[0], uvw[1], uvw[2])
    adj[u].append((v,w))
}

// 초기 작업
d[start] = 0  // 시작점 초기화
q.push(Pair(d[start], start)) // 시작점 큐에 넣고 시작

// 최단 거리 갱신
while let cur = q.pop() {
  if d[cur.v] != cur.d { continue } // 거리가 가장 작은 원소를 큐에서 선택, 그 값이 테이블에 있는 값과 다르면 skip

  // 현재 정점과 인접해 있는 정점들에 대한 거리 갱신
  for (nxtNode, nxtCost) in adj[cur.v] {
    if d[nxtNode] <= d[cur.v] + nxtCost { continue }

    // 현재 정점을 거쳐가는 것이 더 작다면 갱신
    d[nxtNode] = d[cur.v] + nxtCost   // 테이블 갱신
    q.push(Pair(d[nxtNode], nxtNode)) // 큐에 정점 쌍 추가
  }
}

// 거리 테이블 가지고 출력
for i in stride(from: 1, to: v+1, by: 1) {
  if d[i] == inf { print("INF")}
  else { print(d[i]) }
}
```

- [Floyd-Warshall(플로이드-워셜)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/28)

#### MST

- [Kruskcal(크루스칼), Union-find](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/37#issue-1572645569)
- Prim(프림)

## Math

### GCD(최대 공약수)

```swift
// [유클리드 호제법]
// gcd(a, b) = gcd(b, a % b)
func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 { return b }
    return gcd(b, a % b)
}

gcd(2, 6)   // 2
gcd(4, 6)   // 2
gcd(12, 8)  // 4
gcd(3, 4)   // 1
```

### LCM(최소 공배수)

```swift
func lcm(_ arr: [Int]) -> Int {
    var ret = arr[0]
    for num in arr {
        let gcd = gcd(ret, num)
        ret = gcd * (ret/gcd) * (num/gcd)
    }
    return ret
}

lcm([2, 3])         // 6
lcm([3, 6, 9, 12])  // 36
lcm([3, 4, 7, 13])  // 1092
```

### Prime number(소수)

#### 소수 개수

```swift
let N = 1_000_000

// 에라토스테네스의 체 이용
// 일반적인 방법으로 진행하면 시간복잡도가 큼
func countPrimeNumber(_ n:Int) -> Int {
    var prime = Array(repeating: true, count: N+1)
    prime[0...1] = [false, false]

    for i in 2...n {
        if !prime[i] { continue }
        for j in stride(from: i+i, to: n+1, by: i) {
            prime[j] = false
        }
    }

    return prime[0...n].filter { $0 == true }.count
}

countPrimeNumber(13)  // 6(2, 3, 5, 7, 11, 13)
```

#### 소수 판별

```swift
func isPrime(_ n: Int) -> Bool {
    for i in stride(from: 2, to: n, by: 1) {
        if n % i == 0 { return false }
        if i * i > n { break }  // 절반까지만 체크
    }

    return n != 1
}

isPrime(1)
isPrime(2)
isPrime(3)
isPrime(55)
isPrime(13)
```

### Divisor(약수)

```swift
func divisor(of num: Int) -> [Int] {
    return (1...num).filter { num % $0 == 0 }
}

divisor(of: 12) // 1, 2, 3, 4, 6, 12
divisor(of: 7)  // 1, 7
```

### [Permutation(순열)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/35#issuecomment-1418706418)

```swift
func permutation<T: Comparable>(_ target: [T], _ n: Int) -> [[T]] {
  var ret = [[T]]()
  var visited = Array(repeating: false, count: target.count)

  if target.count < n { return ret }

  func recur(_ arr: [T]) {
    if arr.count == n { ret.append(arr); return }
    for i in 0..<target.count {
      if visited[i] { continue }
      visited[i] = true
      recur(arr + [target[i]])
      visited[i] = false
    }
  }

  recur([])
  return ret
}

print(permutation([1, 2, 3], 2))
print(permutation(["a","b","c","d"], 3))
```

### [Combination(조합)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/35#issue-1570833263)

```swift
func combination<T: Comparable>(_ target: [T], _ n: Int) -> [[T]] {
  var ret = [[T]]()
  if target.count < n { return ret }

  func recur(_ arr: [T], _ idx: Int) {
    if arr.count == n { ret.append(arr); return }
    for i in idx..<target.count {
      recur(arr + [target[i]], i + 1)
    }
  }

  recur([], 0)
  return ret
}

print(combination([1, 2, 3], 2))
print(combination(["a","b","c","d"], 3))
```

### Radix transformation(진법 변환)

```swift
Int(string_value: radix: n)! // string_value와 n은 같은 진법을 나타내야 함, string 값을 int 타입으로 변환하는 경우 optional로 반환
String(value, radix: n) // 이 때 value는 int 타입(10진수)
```

- Int -> String
- String -> Int

### Bit(비트)

```swift
2.nonzeroBitCount  // 01
3.nonzeroBitCount  // 11
65.nonzeroBitCount // 1000001
69.nonzeroBitCount // 1000101
```

- Int 타입의 nonzeroBitCount 프로퍼티
- value의 이진법 표현에서 1의 갯수를 의미하는 프로퍼티
- 알고 있지 않으면 무소용

## String

- [#14 String을 어떻게 쓰면 잘 썼다고 소문이 날까?](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/14)
- String.Index
- String to array
- String repeating - init(repeating:count:)
- Character
- ASCII, UnicodeScalar
- Substring, String.Subsequence(typealias)
- radix

## Simulation Ideation

- 좌표 규칙성
- 회전
- 이동(완전탐색, for-loop)
- 확장
- 대칭
- 2차원 배열 디버깅
- row, column swap

## High ordered functions

- forEach
- map
- filter
- reduce
- flatMap
- compactMap
- etc.(for-in, closure)
