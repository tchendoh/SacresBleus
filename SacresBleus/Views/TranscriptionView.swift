//
//  TranscriptionView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-03.
//

import SwiftUI

struct TranscriptionView: View {
    var rawTranscription: String
    @Binding var path: [PathPage]

    let highlightColors: [Color] = [Color.blue.opacity(0.3), Color.red.opacity(0.3), Color.yellow.opacity(0.3), Color.green.opacity(0.3), Color.purple.opacity(0.3)]
    @State var formattedTranscription: AttributedString = AttributedString()
    @State var foundExpressions: [AttributedString] = []

    var body: some View {
        VStack {
            Text(formattedTranscription)
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            HStack {
                VStack (alignment: .leading, spacing: 20) {
                    ForEach(foundExpressions, id:\.self) { expression in
                        Text(expression)
                            .font(.title)
                            .fontWeight(.medium)
                            .onTapGesture {
                                path.append(.expression(String(expression.characters)))
                            }
                        
                    }
                    
                }
                Spacer()
            }
            .padding()
        }
        .onAppear {
            findExpressions()
        }
        
        
        
    }
    func findExpressions() {
        foundExpressions = []
        var result = AttributedString(rawTranscription)
        var highlightColorIndex = 0
        for expression in expressions {
            if rawTranscription.containsIgnoringCase(find: expression) {
                var foundExpression = AttributedString(expression)
                let backgroundColor = highlightColors[highlightColorIndex]
                highlightColorIndex += 1
                if highlightColorIndex >= highlightColors.count {
                    highlightColorIndex = 0
                }
                foundExpression.backgroundColor = backgroundColor
                
                if let range = result.range(of: expression, options: .caseInsensitive) {
                    result.replaceSubrange(range, with: foundExpression)
                }
                foundExpressions.append(foundExpression)
                
            }
            
        }
        formattedTranscription = result
    }

}

#Preview {
    ContentView()
}
