//
//  EuphemismListView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-04-12.
//

import SwiftUI

struct EuphemismListView: View {
    @Environment(DictionaryViewModel.self) private var vm: DictionaryViewModel
    var euphemismList: [String]
    @Binding var path: [PathPage]
    
    var body: some View {
        ForEach(euphemismList, id:\.self) { euphemism in
            if let expression = vm.dictionary[euphemism] {
                Text("\(expression.text)")
                    .underline()
                    .onTapGesture {
                        path.append(.expression(expression))
                    }
                
            } else {
                Text("\(euphemism)")
            }
        }

    }
}

//#Preview {
//    EuphemismListView()
//}
