//
//  Response.swift
//  SentimentAnalyzer
//
//  Created by Sergey Petrosyan on 24.10.25.
//

import Foundation

struct Response: Identifiable {
    let id: String
    let text: String
    let score: Double
    
    static let sampleResponses: [String] = [
        "The future of AI makes me excited. Let it handle repetitive tasks so developers can focus on creating innovative solutions.",
        "I don't mind smarter tools, but relying on AI for everything is a risk. We need human oversight and creativity too.",
        "AI seems like a pretty good idea, but I'm not sure how to use it effectively. Maybe we should start with something simple and build up from there.",
        "I love everything about AI! It's transforming the world in amazing ways. I can't wait to see what the future holds.",
        "There's a helpful AI completion tool on my phone. It's like having a personal assistant that can help me with my tasks. I really like it!",
        "I enjoy tough engineering challenges. If AI takes the grunt work out of those challenges, that would be awesome!",
        "Last time we tried an AI code generator, it didn't quite do what we expected. It was a bit clunky and didn't always give the right answers. Maybe we should try again with a different approach."
    ]
}
