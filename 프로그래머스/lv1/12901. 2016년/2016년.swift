import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let weeks = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let calendar = Calendar(identifier: .gregorian)
    let component = DateComponents(year: 2016, month: a, day: b)
    let date = calendar.date(from: component)
    let weekday = calendar.component(.weekday, from: date!)
    return weeks[weekday-1]
}