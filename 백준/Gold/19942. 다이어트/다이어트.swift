/*
- dfs로 모든 조합을 구한다.
- 이미 순차적으로 조합을 만들기 때문에 사전순 정렬이 된다.
- 이전 조합보다 가격이 작은 경우에만 갱신한다.

1. 조합별 최소 비용 계산
2. dfs 수행
*/

/// 식재료 개수
let n = Int(readLine()!)!

/// 최소 영양성분
let m = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (mp,mf,ms,mv) = (m[0],m[1],m[2],m[3])

/// 재료 목록
var ind = [[Int]]()
for _ in 0..<n {
  ind.append(readLine()!.split{$0 == " "}.compactMap{Int(String($0))})
}

var combi = [Int]()
var minCost = Int.max
var ans = [Int]()

func getSum() {
  var (p,f,s,v,cost) = (0,0,0,0,0)

  for i in combi {
    p += ind[i][0]
    f += ind[i][1]
    s += ind[i][2]
    v += ind[i][3]
    cost += ind[i][4]
  }

  if p >= mp && f >= mf  && s >= ms && v >= mv {
    if minCost > cost {
      minCost = cost
      ans = combi
    }
  }
}

/// - Parameters:
///   - idx: 현재 재료 번호
///   - arr: 번호 조합
// func dfs(_ idx: Int, _ arr: [Int]) {
//   /// 1. 조합 설정
//   combi = arr
  
//   /// 2. 계산
//   getSum()

//   /// 종료 조건
//   if idx == n - 1 {
//     return
//   }

//   dfs(idx+1, arr)
//   dfs(idx+1, arr+[idx])
// }

// dfs(0,[])

func getCombi(_ idx: Int) {
  getSum()

  for i in (idx..<n) {
    if !combi.contains(i) {
      combi.append(i)
      getCombi(i+1)
      combi.popLast()!
    }
  }
}

getCombi(0)

if minCost == Int.max {
  print(-1)
} else {
  print(minCost)
  print(ans.map{$0+1}.map(String.init).joined(separator: " "))
}