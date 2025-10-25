//
//  Scorer.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 24.10.25.
//

import Foundation
import NaturalLanguage

struct Scorer {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    func score(_ text: String) -> Double {
        var sentimentScore: Double = 0
        tagger.string = text
        
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .paragraph, scheme: .sentimentScore) { tag, _ in
            if let sentimentString = tag?.rawValue as? String, let score = Double(sentimentString) {
                sentimentScore = score
            }
            return false
        }
        return sentimentScore
    }
}
