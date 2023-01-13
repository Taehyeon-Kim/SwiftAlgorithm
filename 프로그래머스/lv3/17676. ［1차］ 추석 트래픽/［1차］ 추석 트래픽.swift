import Foundation

struct Log {
    let hour: String
    let minute: String
    let second: String
    let duration: String
    
    var start: Double {
        let h = Double(hour)! * 60 * 60 * 1000
        let m = Double(minute)! * 60 * 1000
        let s = Double(second)! * 1000
        var tmp = duration
        tmp.removeLast()
        let d = Double(tmp)! * 1000 - 1
        return h + m + s - d
    }
    
    var end: Double {
        let h = Double(hour)! * 60 * 60 * 1000
        let m = Double(minute)! * 60 * 1000
        let s = Double(second)! * 1000
        return h + m + s
    }
}


func solution(_ lines:[String]) -> Int {    
    var logs: [Log] = []

    for line in lines {
        let log = line.components(separatedBy: " ")
        let time = log[1].components(separatedBy: ":"), duration = log[2]
        let h = time[0], m = time[1], s = time[2]
        let data = Log(hour: h, minute: m, second: s, duration: duration)
        logs.append(data)
    }
    
    var maxCount = 0
    for i in 0..<logs.count {
        var count = 1
        let end = logs[i].end
        for j in i+1..<logs.count {
            if logs[j].start < end + 1000 {
                count += 1
            }
        }
        maxCount = max(count, maxCount)
    }

    return maxCount
}