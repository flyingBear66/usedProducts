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

    case let action as MessagesActions.RemoveMessage:

        state.messages.remove(at: action.messageId)

    default:
        break
    }

    return state
}
