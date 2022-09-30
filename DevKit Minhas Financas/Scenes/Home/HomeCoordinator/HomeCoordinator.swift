//
//  HomeCoordinator.swift
//  DevKit Minhas Financas
//
//  Created by Diogo Gaspar on 30/09/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
	var navigation: UINavigationController
	
	init(navigation: UINavigationController) {
		self.navigation = navigation
	}
	
	func start() {
		let vc = HomeController()
		
		navigation.show(vc, sender: self)
		
	}
}
