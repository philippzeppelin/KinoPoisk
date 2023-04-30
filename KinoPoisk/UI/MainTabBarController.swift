//
//  MainTabBarController.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 17.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
    }
}

//        viewControllers = [
//            generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "rectangle.fill.on.rectangle.fill")),
//            generateNavigationController(rootViewController: ViewController(), title: "Favorites", image: UIImage(systemName: "heart.fill"))
//        ]
//    }
//
//    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        let navigationVC = UINavigationController(rootViewController: rootViewController)
//        navigationVC.tabBarItem.image = image
//        navigationVC.tabBarItem.title = title
//        navigationVC.navigationBar.scrollEdgeAppearance = navigationVC.navigationBar.standardAppearance
//        return navigationVC
//    }

/*
class MainTabBarController: UITabBarController {

     override func viewDidLoad() {
         super.viewDidLoad()

         view.backgroundColor = .gray

         let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

         viewControllers = [
             generateNavigationController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "rectangle.fill.on.rectangle.fill")),
             generateNavigationController(rootViewController: ViewController(), title: "Favorites", image: UIImage(systemName: "heart.fill"))
         ]
     }

     private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
         let navigationVC = UINavigationController(rootViewController: rootViewController)
         navigationVC.tabBarItem.image = image
         navigationVC.tabBarItem.title = title
         navigationVC.navigationBar.scrollEdgeAppearance = navigationVC.navigationBar.standardAppearance
         return navigationVC
     }
 }
 */
