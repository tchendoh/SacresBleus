//
//  FoundExpressionView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-09.
//

import SwiftUI
import WrappingStack

struct FoundExpressionView: View {
    @Binding var foundExpressions: [FoundExpression]
    @Binding var path: [PathPage]
    private let flexibleColumn = [
        GridItem(.adaptive(minimum: 50, maximum: 200)),
        GridItem(.adaptive(minimum: 0, maximum: 200))
    ]
    
    var body: some View {
        HStack {
            WrappingHStack(id: \.id) {
                ForEach(foundExpressions, id:\.id) { foundExpression in
                    HStack {
                        Text(foundExpression.expression.text)
                            .font(.system(size: 32))
                            .fontWeight(.medium)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .background(foundExpression.color)
                            .overlay {
                                Text(foundExpression.expression.type.rawValue)
                                    .font(.system(size: 12))
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 5)
                                    .foregroundStyle(.white)
                                    .background {
                                        Color.black
                                    }
                                    .offset(x: 20, y: 25)
                            }
                    }
                    .padding(12)
                    .onTapGesture {
                        path.append(.expression(foundExpression.expression))
                    }
                }
            }
            .navigationDestination(for: PathPage.self) { value in
                switch value {
                case .expression(let expression):
                    ResultView(expression: expression, path: $path)
                }
                
            }
            
        }
        .padding()
        
        
        
    }
    
}


#Preview {
    HomeScreen()
        .environment(DictionaryViewModel())
}
