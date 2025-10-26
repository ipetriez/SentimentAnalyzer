//
//  Sentiment.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 24.10.25.
//

import SwiftUI
import Charts

enum Sentiment: String, Plottable, CaseIterable, Identifiable {
    case positive, moderate, negative
    
    init(_ score: Double) {
        if score > 0.2 {
            self = .positive
        } else if score < -0.2 {
            self = .negative
        } else {
            self = .moderate
        }
    }
    
    var id: String { rawValue }
    
    var name: String {
        self.rawValue.capitalized
    }
    
    var icon: String {
        switch self {
        case .positive: return "chevron.up.2"
        case .negative: return "chevron.down.2"
        case .moderate: return "minus"
        }
    }
    
    var sentimentColor: Color {
        switch self {
        case .positive: return .teal
        case .negative: return .red
        case .moderate: return .gray
        }
    }
}
