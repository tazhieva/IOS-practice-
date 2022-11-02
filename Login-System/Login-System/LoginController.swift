//
//  LoginController.swift
//  Login-System
//
//  Created by Акмарал Тажиева on 02.11.2022.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - UIComponents
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign In to your account")
    private let usernameField = CustomTextField(fieldType: .username)
    
    
    // MARK: - Lifecycle
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)

        self.view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 270),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        



        ])
    }
    // MARK: - Selectors
}
