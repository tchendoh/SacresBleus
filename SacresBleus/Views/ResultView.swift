//
//  ResultView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-02-29.
//

import SwiftUI

struct ResultView: View {
    var word: String
    
    var body: some View {
        ZStack {
            Color("Crystal")
                .ignoresSafeArea()

            ScrollView {
                VStack (alignment: .leading) {
                    // MARK: Word title
                    HStack {
                        Text(word)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.vertical)
                    
                    // MARK: Definition
                    HStack {
                        Text("Définition")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Rectangle()
                            .foregroundStyle(.darkGold)
                            .frame(width: 3)
                        Text("bla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla bla")
                    }
                    
                    // MARK: Stats
                    HStack {
                        Text("Statistiques")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("bla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla bla")
                            .padding()
                            
                    }
                    .background {
                        Rectangle()
                            .foregroundStyle(.ultraThinMaterial)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 16)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)  .strokeBorder(.white, lineWidth: 2)
                            }
                            .opacity(0.6)
                    }
                    
                    // MARK: Examples
                    HStack {
                        Text("Exemples")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Rectangle()
                            .foregroundStyle(.crayolaGold)
                            .frame(width: 3)
                        VStack {
                            Text("Item 1")
                            Text("Item 2")
                            Text("Item 3")
                        }
                    }

                    
                }
            }
            .padding()
                
        }

    }
}

#Preview {
    ResultView(word: "hello")
}
