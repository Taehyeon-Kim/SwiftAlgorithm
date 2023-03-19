/*
1. musicinfos를 돌면서 길이만큼 반환해야 함
2. 제목이 key, 악보가 value가 되도록 자료구조를 만들어도 될 것 같음 -> 불필요
3. 시간 인터벌 계산, 시간만큼 악보 계산
4. 포함 여부 체크 및 배열에 집어넣기
*/

// 재생 시간 계산
func timeInterval(_ t1: String, _ t2: String) -> Int {
    let s1 = t1.split(separator: ":")
    let s2 = t2.split(separator: ":")
    
    let (min1, sec1, min2, sec2) = (Int(s1[0])!, Int(s1[1])!, Int(s2[0])!, Int(s2[1])!)
    return (min2 * 60 + sec2) - (min1 * 60 + sec1)
}

/// 샵(#) 음계 변환
func convert(_ str: String) -> String {
    var str = str
    str = str.replacingOccurrences(of: "C#", with: "c")
    str = str.replacingOccurrences(of: "D#", with: "d")
    str = str.replacingOccurrences(of: "F#", with: "f")
    str = str.replacingOccurrences(of: "G#", with: "g")
    str = str.replacingOccurrences(of: "A#", with: "a")
    return str
}

/// 1. 재생시간보다 멜로디가 짧은 경우 반복/이어붙이기
/// 2. 재생시간보다 멜로디가 긴 경우 커트
func makeMelody(_ str: String, _ time: Int) -> String {
    return str.count > time ? String(str.prefix(time)) : String(repeating: str, count: time / str.count) + String(str.prefix(time % str.count))
}


func solution(_ m:String, _ musicinfos:[String]) -> String {
    let m = convert(m)
    var ret = [(timeInterval: Int, title: String)]()
    
    for info in musicinfos {
        let info = info.split(separator: ",").map{String($0)}
        let interval = timeInterval(info[0], info[1])
        
        var melody = convert(info[3])
        melody = makeMelody(melody, interval)

        if melody.contains(m) {
            ret.append((interval, info[2]))
        }
    }

    ret = ret.sorted(by: { $0.timeInterval > $1.timeInterval })
    
    return ret.isEmpty ? "(None)" : ret.first!.title
}