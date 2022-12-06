//
//  ComposableArchitetureTrainingApp.swift
//  ComposableArchitetureTraining
//
//  Created by Felipe Vieira on 06/12/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct ComposableArchitetureTrainingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                        initialState: State(),
                        reducer: reducer
                    )
            )
        }
    }
}
