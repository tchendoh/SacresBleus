//
//  TranscriptionView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-03.
//

import SwiftUI

struct TranscriptionView: View {
    @Environment(DictionaryViewModel.self) private var vm: DictionaryViewModel
    @Binding var rawTranscription: String
    @Binding var foundExpressions: [FoundExpression]
    @State var formattedTranscription = AttributedString()
    let highlightColors: [Color] = [Color.blue.opacity(0.3),
                                    Color.red.opacity(0.3),
                                    Color.yellow.opacity(0.3),
                                    Color.green.opacity(0.3),
                                    Color.purple.opacity(0.3)]
    
    var body: some View {
        VStack {
            Text(formattedTranscription)
                .font(.system(size: 32))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .rotation3DEffect(.degrees(25), axis: (x: 1, y: 0, z: 0))
        }
        .onChange(of: rawTranscription, initial: true) { oldValue, newValue in
            rawTranscription = "T'as encore gagné, mon baptême!"
            if newValue != "" {
                findExpressions()
            }
        }
        
        
        
    }
    func findExpressions() {
        var result = AttributedString(rawTranscription)
        foundExpressions = []
        var highlightColorIndex = 0
        for (_, expression) in vm.dictionary {
            if rawTranscription.containsIgnoringCase(find: expression.text) {
                var attributedString = AttributedString(expression.text)
                let backgroundColor = highlightColors[highlightColorIndex]
                attributedString.backgroundColor = backgroundColor
                
                if let range = result.range(of: expression.text, options: .caseInsensitive) {
                    result.replaceSubrange(range, with: attributedString)
                }
                foundExpressions.append(FoundExpression(expression: expression, color: backgroundColor, attributedString: attributedString))
                
                highlightColorIndex += 1
                if highlightColorIndex >= highlightColors.count {
                    highlightColorIndex = 0
                }
            }
            
        }
        formattedTranscription = result
    }
    
}

#Preview {
    HomeScreen()
        .environment(DictionaryViewModel())
}
