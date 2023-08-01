//
//  SceneDelegate.swift
//  FindCVS
//
//  Created by 한소희 on 2023/08/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
//    let viewModel = LocationInformationViewModel(model: LocationInformationModel())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        let rootViewController = LocationInformationViewController()
//        rootViewController.bind(viewModel)
        
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
        
    }
}

