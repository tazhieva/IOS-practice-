//
//  Model.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import Foundation

class Rocket: Decodable {
    let height : Height
    let diameter: Diameter
    let mass: Mass
    let first_stage: FirstStage
    let second_stage: SecondStage
    let payload_weights: [Leo]
    let flickr_images: [String]
    let name: String
    let cost_per_launch: Double
    let first_flight: String
    let country: String
    let id: String
}


class Height: Decodable {
    let meters: Double
    let feet: Double
}

class Diameter: Decodable {
    let meters: Double
    let feet: Double
}

class Mass: Decodable {
    let kg: Int
    let lb: Int
}

class FirstStage: Decodable {
    let engines: Int
    let fuel_amount_tons: Double
    let burn_time_sec: Int?
}

class SecondStage: Decodable {
    let engines: Int
    let fuel_amount_tons: Double
    let burn_time_sec: Int?
}

class Leo: Decodable {
    let id: String
    let kg: Int
    let lb: Int
}

