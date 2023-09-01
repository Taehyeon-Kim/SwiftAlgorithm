// 처음 득점이 나오는 시점이 중요하다
/*

1 0 -> 0110 -> 20:00
1 1 -> 동점  -> 20:00 동안 1팀이 이기고 있었음
1 2 -> 31:30 -> 48:00 -> 16:30 동안 2팀이 이기고 있었음

1. 카운트할 타이밍 -> 특정 팀의 점수가 더 클 때
2. 점수 카운트 -> s마다 체크

2. 1 == 2 : 카운트 타이밍 x -> stop
2. 1 > 2 : 1팀 시간 카운트
3. 1 < 2 : 2팀 시간 카운트

70s : 1 > 0
..
140s : 2 > 0

45m30s : 2 > 1

while문 돌면서
time 증가

매순간 점수 비교
더 큰쪽 시간 증가
*/

let deadline = 48 * 60

let n = Int(readLine()!)!
var dic = [Int: String]()

for _ in 0..<n {
  let line = readLine()!.split{$0==" "}.map{String($0)}
  let (team, time) = (line[0], line[1])
  let ms = time.split{$0 == ":"}.compactMap{Int(String($0))}
  let (m, s) = (ms[0], ms[1])
  let t = m * 60 + s

  dic[t, default: ""] = team
}

var timer = -1
var ret1 = 0
var ret2 = 0
var time1 = 0
var time2 = 0

while timer < deadline {
  timer += 1

  if timer == deadline { break }
  
  if let team = dic[timer] {
    if team == "1" {
      ret1 += 1
    } else {
      ret2 += 1
    }
  }

  if ret1 == ret2 {
    continue
  }

  if ret1 > ret2 {
    time1 += 1
  } else {
    time2 += 1
  }
}

let time1h = time1/60 < 10 ? "0\(time1/60)" : String(time1/60)
let time1m = time1%60 < 10 ? "0\(time1%60)" : String(time1%60)
let time2h = time2/60 < 10 ? "0\(time2/60)" : String(time2/60)
let time2m = time2%60 < 10 ? "0\(time2%60)" : String(time2%60)

print("\(time1h):\(time1m)")
print("\(time2h):\(time2m)")