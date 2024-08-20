//
//  FontView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-15.
//

import SwiftUI

struct FontView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Large Title").font(.largeTitle)
                Text("Title").font(.title)
                Text("Title2").font(.title2)
                Text("Title3").font(.title3)
                
                Divider()
                
                Text("Headline").font(.headline)
                Text("Subheadline").font(.subheadline)
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Body").font(.body)  // --> default font
                Text("Callout").font(.callout)
                Text("Footnote").font(.footnote)
                Text("Caption").font(.caption)
                Text("Caption2").font(.caption2) // available iOS 14
            }
        }
        
    }
}
#Preview {
    FontView()
        .environment(\.font, .custom("Outfit", size: 16))

    
}
