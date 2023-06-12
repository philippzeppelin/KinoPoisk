//
//  AppDelegate.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainModuleBuilder = MainModuleBuilder()
        let detailModuleBuilder = DetailModuleBuilder()
        let navigationController = UINavigationController()
        let router = Router(mainModuleBuilder: mainModuleBuilder, detailModuleBuilder: detailModuleBuilder, rootController: navigationController)
        router.initialViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
