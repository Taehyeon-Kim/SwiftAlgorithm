/*
[문제] : 콘이 셔틀을 타고 사무실로 갈 수 있는 도착 시각 중 제일 늦은 시각 (대기열에 도착하는 시각)

- 셔틀 9:00 시작, 총 n회 , t분 간격, 셔틀당 m명의 승객 탑승 가능 (9시부터 1대)
- 09:00에 도착한 셔틀은 자리가 있다면 09:00에 줄을 선 크루도 탈 수 있다.
- 단, 콘은 게으르기 때문에 같은 시각에 도착한 크루 중 대기열에서 제일 뒤에 선다.

- n(회) : 셔틀 운행 횟수
- t(분) : 셔틀 운행 간격
- m(명) : 셔틀당 최대 크루 수
- timetable: 크루가 대기열에 도착하는 시각 
*/

import Foundation

func getBusTime(_ n: Int, _ t: Int) -> Int {
    return 540 + (n - 1) * t
}

func makeBusTable(_ n: Int, _ t: Int) -> [Int] {
    var busTable: [Int] = []
    for i in 1...n {
        busTable.append(540 + (i-1) * t)
    }
    return busTable
}

func asMinute(_ time: String) -> Int {
    let time = time.components(separatedBy: ":")
    let h = Int(time[0])!, m = Int(time[1])!
    return h * 60 + m
}

func asTimeString(_ n: Int) -> String {
    let hour = n / 60
    let minute = n % 60
    
    let hString = hour < 10 ? "0"+String(hour) : String(hour)
    let mString = minute < 10 ? "0"+String(minute) : String(minute)
    return "\(hString):\(mString)"
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var times = timetable.map { asMinute($0) }.sorted()
    let lastBus = getBusTime(n, t)
    var busTable = makeBusTable(n, t)
    var answer = 0
    
    if n == 1 {
        if times.count >= m {
            let time = times[0..<m].last!
            if time > lastBus {
                answer = lastBus
            } else {
                answer = time - 1
            }
        } else {
            answer = lastBus
        }
    } 
    
    else {
        while busTable.count != 1 {
            let bus = busTable[0]
            
            var count = 0
            for time in times {
                if time <= bus && count + 1 <= m {
                    count += 1
                    times.removeFirst()
                }
            }
            
            if times.isEmpty { break }
            
            busTable.removeFirst()
        }

        if times.count >= m {
            let time = times[0..<m].last!
            if time > lastBus {
                answer = lastBus
            } else {
                answer = time - 1
            }
        } else {
            answer = lastBus
        }
    }
    
    return asTimeString(answer)
}