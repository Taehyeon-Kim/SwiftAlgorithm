// 인접한 칸 -> 상하좌우를 의미
// 좋아하는 학생 > 비어있는 칸 > 행 번호 작은 > 열 번호 작은

// 0. 학생 번호 - 좋아하는 학생 번호 dict
// [Int: [Int]]

// 1. 자리를 정하는 로직
// - 칸 배열을 만든다. (arr)
// - 들어갈 수 있는 모든 칸 순회하면서 최대 400 * 4 = 1600
// - 다음 타입을 넣는다.(like, empty, row, col)

// - 정렬을 한다. (multiple sort)
// - 좋아하는 학생이 많은 순
// - 빈 칸이 많은 순
// - 행 번호가 작은 순
// - 열 번호가 작은 순

// 2. 만족도 총 합 구하는 로직
// - 모든 자리를 순회
// - 인접(상하좌우) 칸에 좋아하는 학생 수
// - 0: 0, 1: 1, 2: 10, 3: 100, 4: 1000
// - 이진수/비트
// - dict

// 2-1. 좋아하는 학생 수 체크
// 상하좌우 값이 딕셔너리에 있으면 cnt + 1
// 2-2. 바로 점수 계산
// total += 점수

// ~ 12m

import Foundation

// 전체 map : 학생 배치하는 map
var table = [Int: [Int]]() // 학생 테이블
var ans = 0 // 만족도 총합

var order = [Int]()

let n = Int(readLine()!)!
for _ in 0..<n*n {
  let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}

  order.append(input[0])
  for i in 1...4 {
    table[input[0], default: []].append(input[i])
  }
}

var map = Array(repeating: Array(repeating: 0, count: n), count: n)

// print(order)
// 학생 - 좋아하는 학생 번호
// print(table)

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

// 순차적으로 학생 배치하기
// n=3; 9명
for o in order {
  // print("\(o)번째 학생")
  var a = [[Int]]()

  for i in 0..<n {
    for j in 0..<n {
      
      var like = 0
      var empty = 0

      // 이미 자리 배치한 칸이면 skip
      if map[i][j] > 0 { continue }
      
      for k in 0..<4 {
        let (nx, ny) = (i + dx[k], j + dy[k])

        // 범위 넘어가면 skip
        if !((0..<n) ~= nx && (0..<n) ~= ny) { continue }
        

        // print(map[nx][ny])
        // 좋아하는 학생 포함
        if map[nx][ny] == 0 {
          empty += 1
        }
        
        if table[o, default: []].contains(map[nx][ny]) {
          like += 1
        } 
      }

      a.append([like, empty, i, j])
      
    }
  }

  // 여기에서 이제 배치 시작
  // 1. 정렬
  // 2. 맨 첫번째 원소의 (r, c)에 o배치

  a = a.sorted {
    if $0[0] == $1[0] {
      if $0[1] > $1[1] {
        return $0[1] > $1[1]
      } else {
        if $0[2] == $1[2] {
          return $0[3] < $1[3]
        } else {
          return $0[2] < $1[2]
        }
      }
    } else {
      return $0[0] > $1[0]
    }
  }

  // print("\(o)번째 학생: \(a)")

  let (px, py) = (a.first![2], a.first![3])
  map[px][py] = o
  // print(map)
}

for i in 0..<n {
  for j in 0..<n {
    var cnt = 0 // 좋아하는 학생 수
    let num = map[i][j] // 학생 번호
    let likes = table[num, default: []]
    
    for k in 0..<4 {
      let (nx, ny) = (i + dx[k], j + dy[k])
      // 범위 넘어가면 skip
      if !((0..<n) ~= nx && (0..<n) ~= ny) { continue }
      if likes.contains(map[nx][ny]) {
        cnt += 1
      }
    }

    if cnt > 0 {
      ans += Int(pow(Double(10), Double(cnt-1)))  
    }
  }
}

// print(map)
print(ans)