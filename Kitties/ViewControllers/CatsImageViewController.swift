//
//  ViewController.swift
//  Kitties
//
//  Created by Denis Bokov on 09.08.2022.
//

import UIKit

class CatsImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    private let urlCats = "https://api.thecatapi.com/v1/images/search"

    @IBAction func showCats() {
        fetchImageCats()
    }
}

extension CatsImageViewController {
    private func fetchImageCats() {
        guard let url = URL(string: urlCats) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error descrition")
                return
            }
            
            do {
                let imageCat = try JSONDecoder().decode([ImageCat].self, from: data)
                imageCat.forEach { image in
                    print(image.url ?? "")
                    
//                    let image = UIImage(named: image.url ?? "")
//                    DispatchQueue.main.async {
//                        self?.imageView.image = image
//                    }
                    
                }
            } catch let error {
                print(error)
            }

        }.resume()
    }
}

