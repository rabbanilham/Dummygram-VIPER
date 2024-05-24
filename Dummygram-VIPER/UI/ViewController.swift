//
//  ViewController.swift
//  Dummygram-VIPER
//
//  Created by Bagas Ilham on 24/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        // Do any additional setup after loading the view.
        Task {
            await fetchPhotos()
        }
    }
    
    func fetchPhotos() async {
        do {
            let photos = try await DummygramAPI.shared.getPhotos()
            print("photos are \(photos)")
        } catch {
            print("error: \(error)")
        }
    }
}

