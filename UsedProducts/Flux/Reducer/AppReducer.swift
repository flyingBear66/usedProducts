//
//  AppReducer.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import Foundation
import SwiftUIFlux

func appStateReducer(state: AppState, action: Action) -> AppState {
    var state = state
    state.productsState = productsStateReducer(state: state.productsState, action: action)
    return state
}
