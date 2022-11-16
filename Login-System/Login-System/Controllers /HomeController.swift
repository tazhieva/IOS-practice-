//
//  HomeController.swift
//  Login-System
//
//  Created by Акмарал Тажиева on 02.11.2022.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - UIComponents
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.label.text = "tazhieva"

        
    }
    
    
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(label)
        self.view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
        ])
    }
    

    // MARK: - Selectors
    @objc private func didTapLogout() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
