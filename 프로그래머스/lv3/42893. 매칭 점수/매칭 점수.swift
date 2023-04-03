import Foundation

/*
기본점수 - 검색어가 등장하는 횟수(대소문자 무시)
외부링크 - 나가는 링크
링크점수 - 다른 웹페이지의 기본점수 / 다른 웹페이지의 외부 링크 수의 총합
매칭점수 - 기본점수 + 링크점수
*/

func findWord(_ target: [String], _ word: String) -> Int {
    return target.filter { $0 == word }.count
}

func match(in string: String, pattern: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: pattern)
    let nsString = string as NSString
    let range = NSMakeRange(0, nsString.length)
    let matches = regex.matches(in: string, range: range)
    return matches.map {
        String(string[Range($0.range, in: string)!])
    }
}

// "(https://[^\"]+)"
func links(_ page: String, _ pattern: String) -> [String] {
    return match(in: page, pattern: pattern)
}

class Page {
    var urlString = ""
    var defaultScore = 0.0
    var links = [String]()
    var matchingScore = 0.0
    
    init(_ urlString: String, _ score: Double, _ links: [String]) {
        self.urlString = urlString
        self.defaultScore = score
        self.links = links
        self.matchingScore = score
    }
}

func solution(_ word:String, _ pages:[String]) -> Int {
    var dict = [String: (Int, Page)]()
    
    // Extract information from pages
    for (idx, page) in pages.enumerated() {
        let splited = page.split { !$0.isLetter }.map { String($0).lowercased() }
        let score = findWord(splited, word.lowercased())
        
        let ownUrl = links(page, "(<meta property=\"og:url\" content=\"https://[^\"]+)")
            .flatMap{ links($0, "(https://[^\"]+)") }
            .first!
        let otherUrls = links(page, "(<a href=\"https://[^\"]+)")
         .flatMap{ links($0, "(https://[^\"]+)") }
        dict[ownUrl] = (idx, Page(ownUrl, Double(score), otherUrls))
    }

    // Calculate matching points
    for item in dict {
        let page = item.value.1
        let links = page.links
        if links.count == 0 { continue }
        
        let score = Double(page.defaultScore) / Double(links.count)
        for link in links {
            if let link = dict[link] {
                link.1.matchingScore += score
            }
        }
    }
    
    // Make answer from dict(including pages information)
    let result = dict
    .sorted(by: { $0.value.0 < $1.value.0 })
    .sorted(by: { $0.value.1.matchingScore > $1.value.1.matchingScore })
    .map { ($0.value.0, $0.value.1.matchingScore) }

    return result.first!.0
}