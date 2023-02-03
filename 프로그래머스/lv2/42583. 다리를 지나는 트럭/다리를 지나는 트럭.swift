import Foundation

/*
bridge_length: 올라갈 수 있는 트럭 수, 시간
weight: 견딜 수 있는 최대 무게(포함)
truck_weights: 대기하고 있는 트럭의 무게

문제: 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는가?
*/

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var queue: [(truck: Int, time: Int)] = [(trucks.removeFirst(), 1)]
    var time = 1
    
    while true {
        if queue.isEmpty && trucks.isEmpty { break } // base condition
        
        // 시간 증가
        time += 1
        for (i, (tr, t)) in queue.enumerated() {
            queue[i].time += 1
        }
        
        // 다리를 건너는 트럭 체크
        if let (top, t) = queue.first {
            if t > bridge_length {
                _ = queue.removeFirst()
            }
        }
        
        // 기다리는 트럭 체크
        if let waited = trucks.first {
            if queue.isEmpty {
                queue.append((trucks.removeFirst(), 1))
            } else if queue.map { $0.truck }.reduce(0, +) + waited <= weight && queue.count + 1 <= bridge_length {
                queue.append((trucks.removeFirst(), 1))
            }
        }
    }

    return time
}