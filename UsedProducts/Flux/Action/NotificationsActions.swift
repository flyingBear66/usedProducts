//
//  NotificationsActions.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import Foundation
import SwiftUIFlux

struct NotificationsActions {

    // MARK: - Requests

    struct FetchNotifications: AsyncAction {

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let notifications = [sampleNotification1, sampleNotification2, sampleNotification3]
            dispatch(SetNotificationsList(list: notifications))
        }
    }

    struct SetNotificationsList: Action {
        let list: [Notification]
    }
}
