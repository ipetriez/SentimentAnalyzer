//
//  ResponcePieChart.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 25.10.25.
//

import SwiftUI
import Charts

struct ResponcePieChart: View {
    let responses: [Response]
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score > $1.score }
    }
    
    var body: some View {
        Chart(responses) { response in
            SectorMark(
                angle: .value("Type", response.score),
                innerRadius: .ratio(0.75)
            )
            .foregroundStyle(by: .value("Sentiment", response.sentiment))
        }
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .padding()
        .chartForegroundStyleScale([
            Sentiment.positive: Sentiment.positive.sentimentColor,
            Sentiment.negative: Sentiment.negative.sentimentColor,
            Sentiment.moderate: Sentiment.moderate.sentimentColor
        ])
        .chartBackground { proxy in
            GeometryReader { geometry in
                if let anchor = proxy.plotFrame {
                    let frame = geometry[anchor]
                    
                    Image(systemName: "location")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .position(x: frame.midX, y: frame.midY)
                        .foregroundStyle(Color(.systemGray))
                }
            }
        }
    }
}

#Preview {
    ResponcePieChart(
        responses: [
            Response(id: UUID().uuidString, text: Response.sampleResponses[0], score: 1),
            Response(id: UUID().uuidString, text: Response.sampleResponses[1], score: 0.2),
            Response(id: UUID().uuidString, text: Response.sampleResponses[2], score: -1)
        ])
}
