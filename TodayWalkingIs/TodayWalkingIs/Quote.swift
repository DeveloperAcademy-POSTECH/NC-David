//
//  Quote.swift
//  TodayWalkingIs
//
//  Created by David on 2022/12/18.
//

import Foundation


class Quote {
    
    private var shotQuote:[String] = Constants.shotQuotes
    private var shotQuoteBy:[String] = Constants.shotQuoteBy
    private var longQuote:[String] = Constants.longQuotes
    private var longQuoteBy:[String] = Constants.longQuotesBy
    
    
    func getRandomShotQuote() -> [String] {
        let randomInt = Int.random(in: 0...Constants.shotQuotes.count - 1)
        return [shotQuote[randomInt],shotQuoteBy[randomInt]]
    }
    
    func getRandomLongQuote() -> [String] {
        let randomInt = Int.random(in: 0...Constants.longQuotes.count - 1)
        return [longQuote[randomInt],longQuoteBy[randomInt]]
    }
}
