//
//  SentimentsSummarySection.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 25.10.25.
//

import SwiftUI

struct SentimentsSummarySection: View {
    let responses: [Response]
    private var overallSentiment: Sentiment? {
        guard !responses.isEmpty else { return nil }
        return sentimentMap.max(by: { $0.value < $1.value })?.key
    }
    
    private var sentimentMap: [Sentiment: Int] {
        Dictionary(grouping: responses, by: \.sentiment).mapValues(\.count)
    }
    
    var body: some View {
        GroupBox {
            if let overallSentiment {
                HStack {
                    Label("Leaning positive", systemImage: "hyphen")
                        .font(.headline)
                        .foregroundStyle(overallSentiment.sentimentColor)
                    
                    Spacer()
                    
                    Text("\(responses.count) responses")
                }
                .padding(.bottom)
                
                HStack(spacing: 16) {
                    ForEach(Sentiment.allCases) { sentiment in
                        SentimentPill(sentiment: sentiment, percentage: percentage(for: sentiment))
                    }
                }
            } else {
                Text("No responses yet.")
            }
        } label: {
            Label("Overall Sentiment", systemImage: "chart.pie.fill")
        }
    }
    
    private func percentage(for sentiment: Sentiment) -> Int {
        guard !responses.isEmpty else { return 0 }
        let count = sentimentMap[sentiment, default: 0]
        return (Int(round(Double(count) / Double(responses.count) * 100)))
    }
}

#Preview {
    SentimentsSummarySection(responses: [
        Response(id: UUID().uuidString, text: Response.sampleResponses[0], score: 1),
        Response(id: UUID().uuidString, text: Response.sampleResponses[1], score: 0.2),
        Response(id: UUID().uuidString, text: Response.sampleResponses[2], score: -1)
    ])
}
