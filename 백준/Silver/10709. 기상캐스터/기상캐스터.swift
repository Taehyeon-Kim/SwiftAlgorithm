// 1. 그래프 세팅
// 최초 -1으로 초기화 / 구름 자리는 0으로 초기화

// 동쪽으로 w 횟수만큼 반복
// for 문
// 열의 마지막까지 반복

// 매번 전 자리가 0인지 -1인지 체크하고
// 0 이상이면 +1, -1이면 그대로 유지

// 열 -> 행 순으로 반복


let hw = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (h,w) = (hw[0], hw[1])

var graph: [[String]] = []
for _ in 0..<h {
  let line = readLine()!
  .map{String($0)}
  graph.append(line)
}

for i in 0..<h {
  if graph[i][0] == "c" {
    graph[i][0] = "0"
  } else {
    graph[i][0] = "-1"
  }
}

for i in 0..<h {
  for j in 1..<w {
    if graph[i][j] == "c" {
      graph[i][j] = "0"
    } else {
      if graph[i][j-1] == "-1" {
        graph[i][j] = "-1"
      } else {
        let num = Int(graph[i][j-1])!
        graph[i][j] = "\(num+1)"
      }
    }
  }
}

for i in 0..<h {
  for j in 0..<w {
    print(graph[i][j], terminator: " ")
  }
  print()
}