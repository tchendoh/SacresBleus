//
//  TextWithLinks.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-14.
//

import SwiftUI
import WrappingStack
import Observation
import RegexBuilder

struct TextWithLinks: View {
    @Environment(DictionaryViewModel.self) private var vm: DictionaryViewModel
    var rawText: String
    @Binding var path: [PathPage]
    @State var segments: [String] = []

    let regex = Regex {
        Character("@")
        Capture {
            OneOrMore(.word)
        }
    }

    var body: some View {
        WrappingHStack(id: \.self, alignment: .leading) {
            ForEach(segments, id:\.self) { segment in
                if segment.hasPrefix("@") {
                    let keyword = String(segment.dropFirst())
                    if let expression = vm.dictionary[keyword] {
                        Text("\(expression.text)")
                            .underline()
                            .onTapGesture {
                                path.append(.expression(expression))
                            }

                    }
                } else {
                    Text(.init("\(segment)"))
                }
                
            }
        }
        .onAppear {
            if segments.isEmpty {
                var position = rawText.startIndex
                let end = rawText.endIndex
                //                print(rawText[position..<end])
                let matches = rawText.matches(of: regex)
                for match in matches {
                    segments.append(String(rawText[position..<match.range.lowerBound]))
                    segments.append(String(rawText[match.range]))
                    position = match.range.upperBound
                }
                segments.append(String(rawText[position..<end]))
            }
        }


    }
}


//#Preview {
//    TextWithLinks(rawText: "Vient du mot @crisse_bleu ou @calice autre chose, peut-être.")
//        .environment(DictionaryViewModel())
//}
