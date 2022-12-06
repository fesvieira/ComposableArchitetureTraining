//
//  ContentView.swift
//  ComposableArchitetureTraining
//
//  Created by Felipe Vieira on 06/12/22.
//

import SwiftUI
import ComposableArchitecture

struct Enviroment {
    
}

struct State: Equatable {
    var counter = 0
}

enum Action: Equatable {
    case increaseCounter
    case decreaseCounter
}

var reducer : some ReducerProtocol<State, Action> {
    Reduce { state, action in
        switch action {
            
        case .increaseCounter:
            state.counter += 1
            return .none
            
        case .decreaseCounter :
            state.counter -= 1
            return .none
        
        }
    }
}

struct ContentView: View {
    let store: Store<State,Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Button("-"){ viewStore.send(.decreaseCounter) }
                Text(viewStore.counter.description)
                Button("+"){ viewStore.send(.increaseCounter) }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(initialState:State(), reducer:reducer)
        )
    }
}
