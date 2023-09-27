let nlr = readLine()!.split{ $0 == " " }.compactMap{Int(String($0))}
let (N,L,R) = (nlr[0],nlr[1],nlr[2])

var arr = [[Int]]()
for _ in 0..<N {
  arr.append(readLine()!.split{ $0 == " " }.compactMap{Int(String($0))})
}

var ans = 0
while ans <= 2000 { // 최대 2000번 반복
  var flag = 0
  var v = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)

  for i in 0..<N {
    for j in 0..<N {

      if !v[i][j] {
        var q = [(i,j)]
        var alist = [(i,j)]
        var sm = arr[i][j]
        var idx = 0
        v[i][j] = true
        
        while idx < q.count {
          let (cx, cy) = q[idx]
          idx += 1
      
          for (dx, dy) in [(-1,0),(1,0),(0,-1),(0,1)] {
            let (nx,ny) = (cx+dx, cy+dy)
            if (0..<N) ~= nx && (0..<N) ~= ny && !v[nx][ny] && (L...R) ~= abs(arr[cx][cy]-arr[nx][ny]) {
              q.append((nx,ny))
              v[nx][ny] = true
              alist.append((nx,ny))
              sm += arr[nx][ny]
            }
          }
        }
  
        if alist.count > 1 {
          for (ti, tj) in alist {
            arr[ti][tj] = sm / alist.count
          }
        }
  
        let t = alist.count > 1 ? 1 : 0
        flag = max(flag, t)
      }

    }
  }

  if flag == 0 {  // 인구 이동 없으면 종료
    break
  }

  ans += 1  // 일수 증가
}

print(ans)