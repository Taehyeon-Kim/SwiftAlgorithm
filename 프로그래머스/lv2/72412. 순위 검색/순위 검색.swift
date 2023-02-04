import Foundation

func makeDB(_ info: [String]) -> [String: [Int]] {
    var ret: [String: [Int]] = [:]
    
    for content in info {
        let val = content.split(separator: " ").map { String($0) }
        let (langs, jobs, careers, foods, score) = (
            [val[0], "-"],
            [val[1], "-"],
            [val[2], "-"],
            [val[3], "-"],
            Int(val[4])!
        )
        
        for lang in langs {
            for job in jobs {
                for career in careers {
                    for food in foods {
                        let key = "\(lang)\(job)\(career)\(food)"
                        ret[key, default: []].append(score)
                    }
                }
            }
        }
    }
    return ret
}

func binarySearch(by query: [String], in db: [String: [Int]]) -> [Int] {
    var ret = [Int]()
    
    for q in query {
        let arr = q.split(separator: " ").map { String($0) }
        let key = "\(arr[0])\(arr[2])\(arr[4])\(arr[6])"
        let score = Int(arr[7])!
        
        if let scores = db[key] {
            var (low, high, mid) = (0, scores.count - 1, 0)
            
            while low <= high {
                mid = (low + high) / 2
                if scores[mid] < score {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            ret.append(scores.count - low)
        } else {
            ret.append(0)
        }
    }
    
    return ret
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var db = makeDB(info)
    
    // 오름차순 정렬 : 이진 탐색 위함(원하는 점수 빨리 찾기 위해서)
    for data in db {
        db[data.key] = data.value.sorted()
    }
    
    // print(db)
    return binarySearch(by: query, in: db)
}