//
//  ContentView.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 24.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var responseText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    Text("Chart")
                    Text("Overview")
                    
                    ForEach(0 ..< 10) { response in
                        Text("Response")
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
                        
                    }
                    .fontWeight(.semibold)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
