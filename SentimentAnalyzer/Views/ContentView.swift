//
//  ContentView.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 24.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var responseText: String = ""
    @State private var responses = [Response]()
    let scorer = Scorer()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ResponcePieChart(responses: responses)
                    Text("Overview")
                    
                    ForEach(responses) { response in
                        ResponseRowView(response: response)
                            .padding(.horizontal)
                    }
                }
                HStack {
                    TextField(
                        "Your thoughts on the future of AI...",
                        text: $responseText,
                        axis: .vertical
                    )
                    .padding(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                    
                    Button("Done") {
                        doneButtonTap()
                    }
                    .fontWeight(.semibold)
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
        .task {
            for response in Response.sampleResponses {
                saveResponse(response)
            }
        }
    }
    
    private func saveResponse(_ response: String, atTop: Bool = false) {
        let score = scorer.score(response)
        let response = Response(
            id: UUID().uuidString,
            text: response,
            score: score
        )
        
        if atTop {
            responses.insert(response, at: 0)
        } else {
            responses.append(response)
        }
    }
    
    private func doneButtonTap() {
        guard !responseText.isEmpty else { return }
        saveResponse(responseText, atTop: true)
        responseText = ""
    }
}

#Preview {
    ContentView()
}
