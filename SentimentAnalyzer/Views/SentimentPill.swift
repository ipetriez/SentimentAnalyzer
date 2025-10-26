//
//  SentimentPill.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 25.10.25.
//

import SwiftUI

struct SentimentPill: View {
    let sentiment: Sentiment
    let percentage: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: sentiment.icon)
                    .imageScale(.small)
                
                Text(sentiment.name)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            
            Text("\(percentage)%")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
        .background(sentiment.sentimentColor.opacity(0.12), in: Capsule())
        .overlay {
            Capsule()
                .strokeBorder(sentiment.sentimentColor.opacity(0.35), lineWidth: 0.5)
        }
        .foregroundStyle(sentiment.sentimentColor)
    }
}

#Preview {
    SentimentPill(sentiment: Sentiment(0), percentage: 30)
}
