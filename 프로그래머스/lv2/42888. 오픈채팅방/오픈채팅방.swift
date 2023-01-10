import Foundation

// 이름(uid)는 딕셔너리로 관리
// 마지막에 일괄 변경

func solution(_ record:[String]) -> [String] {
    var dict: [String: String] = [:]
    var arr: [[String]] = []
    
    for val in record {
        let split = val.components(separatedBy: " ")
        let cmd = split[0], uid = split[1]
        
        switch cmd {
        case "Enter":
            dict[uid] = split[2]
            arr.append([uid, "들어왔습니다."])
        case "Leave":
            arr.append([uid, "나갔습니다."])
        default:
            dict.updateValue(split[2], forKey: uid)
        }
    }
    
    for (index, val) in arr.enumerated() {
        let str = val[0].replacingOccurrences(of: val[0], with: dict[val[0]]!)
        arr[index][0] = str
    }
    
    return arr.map { "\($0[0])님이 \($0[1])" }
}