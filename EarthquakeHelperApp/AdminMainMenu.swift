//
//  AdminMainMenu.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 17.11.2023.
//
	
import UIKit

class AdminMainMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let menuItems: [String] = ["Demirbaş Listesi", "Depremzede Arama", "Yeni Kayıt Oluştur", "Talepte Bulun", "Konteyner Kent Konumları", "Gelen Talepler"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Ana Menü"
        view.backgroundColor = .systemTeal
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        view.addSubview(tableView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Giriş Ekranı", style: .plain, target: self, action: #selector(dismissSelf))
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let emptyViewController = UIViewController()
            emptyViewController.view.backgroundColor = .white
            navigationController?.pushViewController(emptyViewController, animated: true)
        case 1:
            let emptyViewController = UIViewController()
            emptyViewController.view.backgroundColor = .yellow
            navigationController?.pushViewController(emptyViewController, animated: true)
        case 2:
            let emptyViewController = UIViewController()
            emptyViewController.view.backgroundColor = .green
            navigationController?.pushViewController(emptyViewController, animated: true)
        case 3:
            let emptyViewController = UIViewController()
            emptyViewController.view.backgroundColor = .blue
            navigationController?.pushViewController(emptyViewController, animated: true)
        case 4:
            let emptyViewController = UIViewController()
            emptyViewController.view.backgroundColor = .red
            navigationController?.pushViewController(emptyViewController, animated: true)
        case 5:
            let emptyViewController = UIViewController()
            emptyViewController.view.backgroundColor = .systemTeal
            navigationController?.pushViewController(emptyViewController, animated: true)
        default:
            break
        }
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
}

