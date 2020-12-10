//
//  NotificationsReducer.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import Foundation
import SwiftUIFlux

func notificationsStateReducer(state: NotificationsState, action: Action) -> NotificationsState {
    var state = state
    switch action {
    case let action as NotificationsActions.SetNotificationsList:

        state.notifications = action.list

    default:
        break
    }

    return state
}
