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
- [Priority Queue(Heap)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/32)
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
- [Dijkstra](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/33)
- [Floyd-Warshall(플로이드-워셜)](https://github.com/Taehyeon-Kim/SwiftAlgorithm/issues/28)
- Bellman-Ford(벨만-포드)

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
