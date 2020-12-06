//
//  User.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation

struct User: Codable, Identifiable {

    let id: Int

    let name: String

    let image: String
}
