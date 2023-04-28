/*
계란에는 내구도와 무게가 존재

계란끼리 치게 되면 각 계란의 내구도는 상대 계란의 무게만큼 깎이게 됨
내구도 0이하 -> 깨짐

내구도 무게
7   5  -> 3
3   4  -> -2 -> 깨짐

1. 탐색(왼쪽부터 차례대로 계란 탐색)
2. 계란을 들었으면 깨트릴 수 있는 계란 탐색
    - 손에 든 계란이 깨지면 skip
    - 남은 계란 중에 깨지지 않은 계란이 없으면 skip

3. 최대한 많이 깨트리려면 깨트릴 수 있는 내구도 중에 가장 큰 것을 부숴버리면 되니깐.
4. 순서는 상관없어보임

다시 정리
1. 정렬
내구도는 큰 순서대로, 무게도 큰 순서대로 정렬

1. 계란을 든다.
2. 남은 계란 중에서 깨트릴 수 있는 계란을 찾는다. -> 

모두 깨트릴 수 있는 경우 ~ 모두 깨트릴 수 없는 경우
o o o o o o o o
x o o o o o o o
o x o o o o o o
o o x o o o o o
...
8C0 + 8C1 + 8C2 + 8C3 + ... + 8C8

8^8 = 2^24 = 1600만 가지

dfs()

1. 깨트릴 수 있는지 비교 로직
2. 재귀 로직
3. 최댓값 갱신 로직
*/

import Foundation

let n = Int(readLine()!)!
var eggs = [(s: Int, w: Int)]()

for _ in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  eggs.append((line[0], line[1]))
}

var mx = 0  // 최대 깨진 계란 개수

// idx: 현재 계란 인덱스, cnt: 현재까지 깨진 계란 개수
func dfs(_ idx: Int, _ cnt: Int) {

  // 종료 조건
  if idx == n {
    mx = max(mx, cnt)
    return
  }

  // 현재 선택한 계란이 깨진 거라면
  if eggs[idx].s <= 0 {
    dfs(idx + 1, cnt)
  }

  else {
    var flag = false

    for i in 0..<n {
      if i == idx { continue }
      if eggs[i].s <= 0 { continue }

      flag = true
      eggs[i].s -= eggs[idx].w  // 무게 감소
      eggs[idx].s -= eggs[i].w  // 무게 감소

      var count = 0
      count += eggs[i].s <= 0 ? 1 : 0
      count += eggs[idx].s <= 0 ? 1 : 0

      dfs(idx + 1, cnt + count)

      eggs[i].s += eggs[idx].w  // 원상 복구
      eggs[idx].s += eggs[i].w  // 원상 복구
    }

    if !flag {
      dfs(idx + 1, cnt)
    }
  }
}

dfs(0, 0)

print(mx)