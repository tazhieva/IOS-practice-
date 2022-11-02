//
//  SettingsViewController.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var height: UISegmentedControl!
    @IBOutlet weak var diameter: UISegmentedControl!
    @IBOutlet weak var mass: UISegmentedControl!
    @IBOutlet weak var leo: UISegmentedControl!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setSettings()
        
        colorSegmentedControl(item: height)
        colorSegmentedControl(item: diameter)
        colorSegmentedControl(item: mass)
        colorSegmentedControl(item: leo)
        

        height.addTarget(self, action: #selector(heightChanged(_:)), for: .valueChanged)
        diameter.addTarget(self, action: #selector(diameterChanged(_:)), for: .valueChanged)
        mass.addTarget(self, action: #selector(massChanged(_:)), for: .valueChanged)
        leo.addTarget(self, action: #selector(leoChanged(_:)), for: .valueChanged)
    }
    

    func setSettings(){
        height.selectedSegmentIndex = CofigurationHolder.instance.height == UnitMeasure.meters ? 0 : 1
        diameter.selectedSegmentIndex = CofigurationHolder.instance.diameter == UnitMeasure.meters ? 0 : 1
        mass.selectedSegmentIndex = CofigurationHolder.instance.mass == UnitMeasure.kg ? 0 : 1
        leo.selectedSegmentIndex = CofigurationHolder.instance.leo == UnitMeasure.kg ? 0 : 1
    }
    

    @objc func heightChanged(_ sender: UISegmentedControl) {
        CofigurationHolder.instance.height = sender.selectedSegmentIndex == 0 ? UnitMeasure.meters : UnitMeasure.feet
        CofigurationHolder.instance.delegate?.onSettingsChange()
    }
    
    @objc func diameterChanged(_ sender: UISegmentedControl) {
        CofigurationHolder.instance.diameter = sender.selectedSegmentIndex == 0 ? UnitMeasure.meters : UnitMeasure.feet
        CofigurationHolder.instance.delegate?.onSettingsChange()
    }
    
    @objc func massChanged(_ sender: UISegmentedControl) {
        CofigurationHolder.instance.mass = sender.selectedSegmentIndex == 0 ? UnitMeasure.kg : UnitMeasure.lb
        CofigurationHolder.instance.delegate?.onSettingsChange()
    }
    
    @objc func leoChanged(_ sender: UISegmentedControl) {
        CofigurationHolder.instance.leo = sender.selectedSegmentIndex == 0 ? UnitMeasure.kg : UnitMeasure.lb
        CofigurationHolder.instance.delegate?.onSettingsChange()
    }
    

    func colorSegmentedControl(item: UISegmentedControl) {
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
    }
    
    

    @IBAction func cancelScreen(_ sender: UIBarButtonItem) {
        self.view.window?.rootViewController?.dismiss(animated: true)
    }
}
