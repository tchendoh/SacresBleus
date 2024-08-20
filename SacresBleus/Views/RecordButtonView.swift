//
//  RecordButtonView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-09.
//

import SwiftUI


struct RecordButtonView: View {
    @Binding var isRecording: Bool
    var buttonSize: CGFloat = 140
    
    var body: some View {
        ZStack {
            Image(isRecording ? "logoNoShadowSacresBleus" : "logoBlackSacresBleus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: buttonSize)
                .clipShape(Circle())

            Image(systemName: "circle")
                .font(.system(size: buttonSize))
                .opacity(isRecording ? 0.5 : 1)
                .onLongPressGesture(minimumDuration: 0) {
                    withAnimation(.bouncy) {
                        isRecording = true
                    }
                    
                }
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { _ in
                            withAnimation(.easeOut) {
                                isRecording = false
                            }
                        }
                )
        }
    }
}

#Preview {
    Group {
        RecordButtonView(isRecording: .constant(false))
        RecordButtonView(isRecording: .constant(true))
    }
}
