// 현재 상황에서 설치, 삭제가 가능한지 확인하는 메소드
func isAvailable(_ structures: Set<[Int]>) -> Bool {
    for structure in structures {
        let (x, y, type) = (structure[0], structure[1], structure[2])
        
        if type == 0 { // 기둥
            if y == 0 { continue }
            if structures.contains([x, y-1, 0]) { continue } // 다른 기둥 위
            if structures.contains([x-1, y, 1]) || structures.contains([x, y, 1]) { continue } // 보 한쪽 끝 위
            return false
        }
        
        else if type == 1 { // 보
            if structures.contains([x, y-1, 0]) || structures.contains([x+1, y-1, 0]) { continue } // 기둥 위
            if structures.contains([x-1, y, 1]) && structures.contains([x+1, y, 1]) { continue } // 보 양쪽과 연결
            return false
        }
    }
    return true
}

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var rets = Set<[Int]>()
    
    for frame in build_frame {
        let (x, y, type, op) = (frame[0], frame[1], frame[2], frame[3])
        let structure = [x, y, type]
        
        if op == 0 { // 삭제
            rets.remove(structure)
            if !isAvailable(rets) {
                rets.insert(structure)
            }
        } else if op == 1 { // 설치
            rets.insert(structure)
            if !isAvailable(rets) { 
                rets.remove(structure)
            }
        }
    }

    return rets.sorted {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] < $1[2]   
            } else {
                return $0[1] < $1[1]    
            }
        }

        return $0[0] < $1[0]
    }
}