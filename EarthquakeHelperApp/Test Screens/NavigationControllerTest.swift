//
//  NavigationControllerTest.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 06.01.2024.
//

/*import UIKit

class ViewController: UIViewController {
    let button = UIButton ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        button.setTitle("Yeni bir ekran aç", for: .normal); view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector (didTapButton),
                         for: .touchUpInside)
    }
    @objc private func didTapButton() {
        let rootVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present (navVC, animated: true)
    }
    
}

class SecondViewController: UIViewController {
    
    private let button = UIButton ()

    override func viewDidLoad() {
        super.viewDidLoad ()
        view.backgroundColor = .systemRed
        title = "Hoş geldiniz"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Geri Dön", style: .plain, target: self, action: #selector(dismissSelf))
    
        button.setTitle("Yeni bir sekme aç", for: .normal)
        view.addSubview(button)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapButton),
        for: .touchUpInside)
    }
    @objc private func didTapButton() {
        let vc = UIViewController()
            vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}
*/


