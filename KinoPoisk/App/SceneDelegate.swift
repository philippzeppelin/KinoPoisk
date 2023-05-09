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
        let mainTableViewController = MainTableViewController()
//        let navigationController = UINavigationController()
        let rootController = UINavigationController(rootViewController: mainTableViewController)
        let router = Router(builder: builder, rootController: rootController, mainTableViewController: mainTableViewController)
//        let router = Router(navigationController: navigationController, builder: builder)
        router.initialViewController()
        window.rootViewController = rootController
//        window.rootViewController = UINavigationController(rootViewController: ModuleBuilder.createTableViewModule(router: <#RouterProtocol#>))
        window.makeKeyAndVisible()
        self.window = window
    }
}
