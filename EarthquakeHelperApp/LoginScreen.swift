//
//  LoginScreen.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 22.03.2024.
//

import UIKit

class LoginScreenViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {
    
    let label1: ReusableLabel = ReusableLabel(labelText: "Giriş Yapın", labelType: .font1, labelColor: .black)
    let label2: ReusableLabel = ReusableLabel(labelText: "Lütfen e-Devlet hesabınız ile giriş yapınız", labelType: .font1, labelColor: .gray)
    let button3: FullWidthButton = FullWidthButton(buttonText: "Giriş Yap", isPassive: false)
    
    private let nameTextField: FloatLabelTextField = {
            let textField = FloatLabelTextField()
            textField.placeholder = "TC Kimlik Numarası"
            textField.keyboardType = .numberPad
            return textField
        }()
        
        private let passwordTextField: FloatLabelTextField = {
            let textField = FloatLabelTextField()
            textField.placeholder = "Şifre"
            textField.isSecureTextEntry = true
            return textField
        }()
    
    override func viewDidLoad() {
        
        
        let guide = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(button3)
        button3.addTarget(self, action: #selector(registerClicked), for: .touchUpInside)

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Geri Dön", style: .plain, target: self, action: #selector(dismissSelf))
        
        
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
        bodyStackView.addArrangedSubview(nameTextField)
        bodyStackView.addArrangedSubview(passwordTextField)
        bodyStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bodyStackView)
        
        let passwordStackView = UIStackView()
        passwordStackView.axis  = NSLayoutConstraint.Axis.vertical
        passwordStackView.distribution  = UIStackView.Distribution.equalSpacing
        passwordStackView.alignment = UIStackView.Alignment.trailing
        passwordStackView.spacing = 16
        passwordStackView.addArrangedSubview(button3)
        bodyStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(passwordStackView)
        
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing   = 40
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(bodyStackView)
        stackView.addArrangedSubview(passwordStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            headerStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 96),
            bodyStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 18),
            bodyStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    func validateRegistrationFields() -> Bool {
        
        guard let name = nameTextField.text, !name.isEmpty, name.count >= 11 else {
            showAlert(message: "Lütfen en az 11 haneli bir TC kimlik numarası giriniz.")
            return false
        }
        
        guard let password = passwordTextField.text, !password.isEmpty, password.count >= 6 else {
            showAlert(message: "Lütfen en az 6 haneli bir şifre giriniz.")
            return false
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if textField == nameTextField {
                let allowedCharacters = CharacterSet(charactersIn: "0123456789")
                let characterSet = CharacterSet(charactersIn: string)
                return allowedCharacters.isSuperset(of: characterSet)
            }
            return true
        }
    
    @objc func registerClicked(_ sender: Any) {
        if validateRegistrationFields() {
            let viewController2 = AdminMainMenuViewController()
            let navigationController = UINavigationController(rootViewController: viewController2)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        }
    }

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Geçersiz Deneme", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUserMainMenuVC" {
            let viewController3 = UserMainMenuViewController()
            let navigationController2 = UINavigationController(rootViewController: viewController3)
            navigationController2.modalPresentationStyle = .fullScreen
            present(navigationController2, animated: true)
        }
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
}
