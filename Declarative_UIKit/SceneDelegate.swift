//
//  SceneDelegate.swift
//  Declarative_UIKit
//
//  Created by Geri Borbás on 28/11/2020.
//  http://www.twitter.com/Geri_Borbas
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let windowScene = scene as? UIWindowScene {
			self.window = UIWindow(windowScene: windowScene).with {
				$0.rootViewController = EmbeddedStackViewsViewController()
				$0.makeKeyAndVisible()
			}
		}
	}
}

