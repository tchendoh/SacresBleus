//
//  HomeScreen.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-06.
//

import SwiftUI

enum PathPage: Hashable {
    case expression(Expression)
}

struct HomeScreen: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var stackPath: [PathPage] = []
    @State var foundExpressions: [FoundExpression] = []
    @State private var isRecording = false
    @State private var firstTime = true

    var body: some View {
        NavigationStack(path: $stackPath) {
            GeometryReader { geo in
                VStack {
                    // MARK: Top part
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                if firstTime {
                                    VStack (spacing: 5) {
                                        Text("Appuie,")
                                        Text("sacre,")
                                        Text("apprends.")
                                    }
                                    .font(.system(size: 28))
                                    .fontWeight(.medium)

                                } else {
                                    TranscriptionView(rawTranscription: $speechRecognizer.transcript, foundExpressions: $foundExpressions)
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    // MARK: Bottom part
                    VStack {
                        Spacer()
                        FoundExpressionView(foundExpressions: $foundExpressions, path: $stackPath)
                        Spacer()
                    }
                    .padding(.top, 50)
                }
                .ignoresSafeArea()
                .overlay {
                    VStack {
                        Spacer()
                        RecordButtonView(isRecording: $isRecording)
                        Spacer()
                    }

                }
                .onChange(of: isRecording) { oldValue, newValue in
                    if newValue == true {
                        firstTime = false
                        speechRecognizer.resetTranscript()
                        speechRecognizer.startTranscribing()
                    } else {
                        print(speechRecognizer.transcript)
                        speechRecognizer.stopTranscribing()                        
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
