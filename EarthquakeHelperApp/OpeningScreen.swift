//
//  OpeningScreen.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 22.03.2024.
//

import UIKit

class OpeningScreenViewController: UIViewController, UINavigationControllerDelegate {
    
    let label1: ReusableLabel = ReusableLabel(labelText: "Hoş Geldiniz", labelType: .font1, labelColor: .black)
    let label2: ReusableLabel = ReusableLabel(labelText: "Lütfen kullanıcı giriş türü seçin", labelType: .font1, labelColor: .gray)
    let button1: FullWidthButton = FullWidthButton(buttonText: "Admin Giriş", isPassive: false)
    let button2: FullWidthButton = FullWidthButton(buttonText: "Kullanıcı Giriş", isPassive: false)
    
    
    override func viewDidLoad() {
        
        let guide = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(button1)
        view.addSubview(button2)
        button1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        
        
        let headerStackView = UIStackView()
        headerStackView.axis  = NSLayoutConstraint.Axis.vertical
        headerStackView.distribution  = UIStackView.Distribution.equalSpacing
        headerStackView.alignment = UIStackView.Alignment.center
        headerStackView.spacing   = 16.0
        headerStackView.addArrangedSubview(label1)
        headerStackView.addArrangedSubview(label2)
        label1.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label2.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerStackView)
        
        let bodyStackView = UIStackView()
        bodyStackView.axis  = NSLayoutConstraint.Axis.vertical
        bodyStackView.distribution  = UIStackView.Distribution.equalSpacing
        bodyStackView.alignment = UIStackView.Alignment.fill
        bodyStackView.spacing   = 16.0
        bodyStackView.addArrangedSubview(button1)
        bodyStackView.addArrangedSubview(button2)
        bodyStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bodyStackView)
        
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 40
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(bodyStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
        view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
        guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0),
        headerStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
        bodyStackView.topAnchor.constraint(equalTo: headerStackView.safeAreaLayoutGuide.bottomAnchor),
        bodyStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc func button1Pressed() {
        let viewController1 = LoginScreenViewController()
        let navigationController = UINavigationController(rootViewController: viewController1)
        navigationController.modalPresentationStyle = .fullScreen
        present (navigationController, animated: true)
    }

    @objc func button2Pressed() {
        let viewController1 = UserMainMenuViewController()
        let navigationController = UINavigationController(rootViewController: viewController1)
        navigationController.modalPresentationStyle = .fullScreen
        present (navigationController, animated: true)
    }

}
