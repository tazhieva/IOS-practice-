//
//  CofigurationHolder.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import Foundation

protocol SettingsChangedDelegate {
    func onSettingsChange()
}


final class CofigurationHolder {
    
    static let instance = CofigurationHolder()
    
    private init() {}
    
    var delegate: SettingsChangedDelegate?
    
    var height: UnitMeasure?
    var diameter: UnitMeasure?
    var mass: UnitMeasure?
    var leo: UnitMeasure?
}
