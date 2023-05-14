//
//  CustomImageView.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.05.2023.
//

import UIKit

class CustomImageView: UIImageView {
    var task: URLSessionDataTask?

    func loadImage(url: URL) {
        image = nil

        if let task = task {
            task.cancel()
        }

        task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Couldn't load image. Reason: \(String(describing: error?.localizedDescription))")
                return
            }
            DispatchQueue.main.async {
                self?.image = newImage
            }
        }
        task?.resume()
    }
}
