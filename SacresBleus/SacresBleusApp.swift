//
//  SacresBleusApp.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-06.
//

import SwiftUI
import Observation

@main
struct SacresBleusApp: App {
    @State var vm = DictionaryViewModel()

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(vm)
        }
    }
}
