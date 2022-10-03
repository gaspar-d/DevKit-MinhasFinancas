//
//  AppDelegate.swift
//  DevKit Minhas Financas
//
//  Created by Diogo Gaspar on 30/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	// TODO: - this is used by the AppFont to override the systemFont
	override init() {
		super.init()
		UIFont.overrideInitialize()
	}
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	}


	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
		
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

