//
//  SceneDelegate.swift
//  DevKit Minhas Finanças
//
//  Created by Diogo Gaspar on 30/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let navigation = UINavigationController()
		let coordinator = HomeCoordinator(navigation: navigation)
		coordinator.start()
		
		let safeWindow  = UIWindow(windowScene: windowScene)
		safeWindow.rootViewController = navigation
		safeWindow.makeKeyAndVisible()
		
		self.window = safeWindow
	}

	func sceneDidDisconnect(_ scene: UIScene) {}

	func sceneDidBecomeActive(_ scene: UIScene) {}

	func sceneWillResignActive(_ scene: UIScene) {}

	func sceneWillEnterForeground(_ scene: UIScene) {}

	func sceneDidEnterBackground(_ scene: UIScene) {}
}

