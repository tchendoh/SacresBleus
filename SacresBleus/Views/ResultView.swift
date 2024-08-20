//
//  ResultView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-02-29.
//

import SwiftUI
import Charts


struct Stat: Identifiable {
    let id = UUID()
    let category: String
    let level: Double
}

struct ResultView: View {
    @Environment(\.colorScheme) var colorScheme
    var expression: Expression
    @Binding var path: [PathPage]
    let bodyFontSize: CGFloat = 22
    let sectionTitleFontSize: CGFloat = 24
    @State private var speechSynthesizer = SpeechSynthesizer()
    
    
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // MARK: Word title
                HStack {
                    Text(expression.text)
                        .font(.system(size: 44))
                        .fontWeight(.heavy)
                        .textCase(.uppercase)
                        .kerning(-1)
                    Spacer()
                }
                .padding(.bottom, 5)
                
                // MARK: Phonetic
                HStack (alignment: .firstTextBaseline) {
                    Button {
                        speechSynthesizer.speakText(expression.text)
                    } label: {
                        Image(systemName: "megaphone.fill")
                            .font(.system(size: 20))
                    }
                    
                    Text("[\(expression.phonetic)]")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .kerning(4)
                    Text("•")
                        .font(.system(size: 20))
                    switch expression.type {
                    case .blasphemyOrigin:
                        Text("Mot d'origine")
                            .fontWeight(.semibold)
                    case .blasphemy:
                        Text("Juron")
                            .fontWeight(.semibold)
                    case .blasphemyEuphemism:
                        Text("Euphémisme")
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
            }
            .padding(.vertical)
            
            // MARK: Definition
            VStack (spacing: 0) {
                HStack {
                    Text("DÉFINITION")
                        .font(.system(size: sectionTitleFontSize))
                        .fontWeight(.bold)
                        .opacity(0.7)
                    Spacer()
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text(expression.definition)
                        .font(.system(size: bodyFontSize))
                    Spacer()
                }
            }
            .padding(.vertical)
            
            // MARK: Origin
            VStack (spacing: 0) {
                HStack {
                    Text("ORIGINE")
                        .font(.system(size: sectionTitleFontSize))
                        .fontWeight(.bold)
                        .opacity(0.7)
                    
                    Spacer()
                }
                .padding(.bottom, 5)
                
                HStack {
                    TextWithLinks(rawText: expression.origin, path: $path)
                        .font(.system(size: bodyFontSize))
                    Spacer()
                }
            }
            .padding(.vertical)
            
            // MARK: Stats
            if expression.type != .blasphemyOrigin {
                VStack (spacing: 0) {
                    HStack {
                        Text("STATISTIQUES")
                            .font(.system(size: sectionTitleFontSize))
                            .fontWeight(.bold)
                            .opacity(0.7)
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    //                HStack {
                    //                    MeterView(type: .frequency, level: expression.frequency)
                    //                        .padding()
                    //                    Spacer()
                    //                    MeterView(type: .profanity, level: expression.profanityLevel)
                    //                        .padding()
                    //                }
                    
                    Chart([Stat(category: "Fréquence", level: expression.frequency), Stat(category: "Virulence", level: expression.profanityLevel)]) {
                        BarMark(
                            xStart: .value("", 0),
                            xEnd: .value("", $0.level),
                            y: .value("Category", $0.category)
                        )
                    }
                    .chartXScale(domain: 0 ... 10)
                    .chartXAxis(.hidden)
                    
                    
                }
                .padding(.vertical)
            }
            
            // MARK: Euphémisme
            if !expression.euphemism.isEmpty {
                VStack (spacing: 0) {
                    HStack {
                        Text("EUPHÉMISMES")
                            .font(.system(size: sectionTitleFontSize))
                            .fontWeight(.bold)
                            .opacity(0.7)
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    HStack {
                        EuphemismListView(euphemismList: expression.euphemism, path: $path)
                            .font(.system(size: bodyFontSize))
                        Spacer()
                    }
                }
                .padding(.vertical)

            }
            
            // MARK: Examples
            VStack (spacing: 3) {
                HStack {
                    Text("EXEMPLES")
                        .font(.system(size: sectionTitleFontSize))
                        .fontWeight(.bold)
                        .opacity(0.7)
                    Spacer()
                }
                .padding(.bottom, 5)
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(expression.example, id:\.self) { example in
                        HStack(alignment: .top, spacing: 0) {
                            //                                VStack(alignment: .leading) {
                            //                                    Text("•")
                            //                                        .font(.system(size: bodyFontSize))
                            //                                }
                            //                                .padding(.leading, 4)
                            //                                .padding(.trailing, 5)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(.init(example))
                                        .font(.system(size: bodyFontSize))
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    path.removeLast()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .fontWeight(.bold)
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environment(DictionaryViewModel())
}
