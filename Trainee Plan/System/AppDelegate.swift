//
//  AppDelegate.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // переопределение точки для настройки после загрузки приложения
        print("18.AppDelegate didFinishLaunchingWithOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        // вызывыетя при создании нового сеанса сцены
        // используйте этот метод чтобы выбрать конфигурацию для создания новой сцены
        print("18.AppDelegate configurationForConnecting")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        // вызывается когда пользователь отменяет сенас сцены
        // используйте метод чтобы освободить ресурсы относящиеся к отмененным сценам так как они не вернутся
        
        print("18.AppDelegate didDiscardSceneSessions")
    }


}

