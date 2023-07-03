// 경우의 수 문제 -> 조합 혹은 순열
// 모든 경우를 찾아서 풀 수 있는가 -> n이 최대 20
// 팀 절반만 찾으면 되니까 20개 중에 10개 뽑는 경우의 수
// 그냥 모든 경우 탐색 -> 이진 트리로 구성 -> n이 20이니까 2^20승 = 약 100만

let n = Int(readLine()!)!
let m = n/2
var arr = [[Int]]()
for _ in 0..<n {
  let input = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
  arr.append(input)
}

var ans = Int.max
func dfs(_ idx: Int, _ alist: [Int], _ blist: [Int]) {
  // 종료 조건
  if idx == n {
    if alist.count == blist.count {
      var (asum, bsum) = (0, 0)
      for i in 0..<m {
        for j in 0..<m {
          asum += arr[alist[i]][alist[j]]
          bsum += arr[blist[i]][blist[j]]
        }
      }
      ans = min(ans, abs(asum - bsum))
    }
    return
  }

  // 이진 트리로 구성 -> 각 사람이 a팀에 속할지, b팀에 속할지 2가지 경우로 나뉨
  dfs(idx+1, alist+[idx], blist)
  dfs(idx+1, alist, blist+[idx])
}

dfs(0,[],[])
print(ans)