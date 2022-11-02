//
//  ModelLaunch.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import Foundation


class Launch: Decodable {
    let name: String
    let date_utc: String
    let rocket: String
    let success: Bool?
}
