//
//  MessagesActions.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation
import SwiftUIFlux

struct MessagesActions {

    // MARK: - Requests

    struct FetchMessages: AsyncAction {

        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            let messages = [sampleMessage1, sampleMessage2, sampleMessage3]
            dispatch(SetMessagesList(list: messages))
        }
    }

    struct SetMessagesList: Action {
        let list: [Message]
    }

    struct RemoveMessage: Action {
        let messageId: Int
    }
}
