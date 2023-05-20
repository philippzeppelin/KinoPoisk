//
//  SceneDelegate.swift
//  KinoPoisk
//
//  Created by Philipp Zeppelin on 10.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let builder = ModuleBuilder()
        let navigationController = UINavigationController()
        let router = Router(builder: builder, rootController: navigationController)
        router.initialViewController()
        window.rootViewController = DetailViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}

/*
 let window = UIWindow(windowScene: windowScene)
 let navigationController = UINavigationController()
 let assemblyBuilder = AssemblerModuleBuilder()
 let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
 router.inititialViewController()
 window.rootViewController = navigationController
 window.makeKeyAndVisible()
 self.window = window
 */
