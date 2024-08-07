//
//  UserMainMenu.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 22.03.2024.
//

import UIKit
import GoogleMaps

class UserMainMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let menuItems: [String] = ["Yardım İste", "Talepte Bulun", "Konteyner Kent Konumları"]
    
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
            let mapViewController = UIViewController()
            mapViewController.loadViewIfNeeded()
            let camera = GMSCameraPosition(latitude: 38.334856324598526, longitude: 38.274563209679954, zoom: 16.0)
            let mapView = GMSMapView.map(withFrame: mapViewController.view.bounds, camera: camera)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: 38.334856324598526, longitude: 38.274563209679954)
            marker.title = "Fahri Kayahan Konteyner Kent"
            marker.snippet = "Malatya"
            marker.map = mapView
            mapViewController.view.addSubview(mapView)
            navigationController?.pushViewController(mapViewController, animated: true)
        default:
            break
        }
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
}
