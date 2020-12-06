//
//  MessagesReducer.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation
import SwiftUIFlux

func messagesStateReducer(state: MessagesState, action: Action) -> MessagesState {
    var state = state
    switch action {
    case let action as MessagesActions.SetMessagesList:

        state.messages = action.list

    default:
        break
    }

    return state
}
