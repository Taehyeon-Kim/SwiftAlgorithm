func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var idx = 0 // cache의 번호를 가리키는 인덱스
    var costs = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for city in cities {
        let city = city.lowercased()
        if cache.contains(city) {
            let index = cache.firstIndex(of: city)!
            let popped = cache.remove(at: index)
            cache.append(popped)
            costs += 1
            
        } else {
            if idx == cacheSize {
                let _ = cache.removeFirst()
                cache.append(city)
            } else {
                cache.append(city)
            }
            costs += 5
        }
        
        idx = cache.count
    }
    
    return costs
}