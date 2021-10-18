//
//  SceneDelegate.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootVC = ViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        window.rootViewController = navigationVC
        self.window = window
        window.makeKeyAndVisible()
        print("18.SceneDelegate scene")

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        // вызывается когда сцена освобождается системой
        // это происходит после того как сцена переходит в фон или ее сеанс отменяется
        // освобождаем все ресерсы, связанные с этой сценой, которые можно будет восстановить при следующем подключении сцены
        print("18.SceneDelegate sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        // вызывается когда сцена перешла из неактивного состояния в активное
        // используйте этот метод для презапуска любых задач, которые были приостановлены (или ще не запущены) когда сцены была неактивна
        print("18.SceneDelegate sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        // вызывается когда сцена перехеодит из активного состояния в неактивное
        // это может произойти из за временных прерываний, например входящий звонок
        print("18.SceneDelegate sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        // вызывается при переходе сцены их бэграунда в фограунд
        // испольхуйте этот метод чтобы отменить изменения сделанные при входе на фон
        print("18.SceneDelegate sceneWillEnterForeground")
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        // вызывается при переходе сцены от форграунда к фону
        // используйте для сохранения данных, освобождения ресурсов и хранения достаточных ремурсов о стостоянии текущей сцены
        // чтобы вернуть сцену к её текущему стостоянию
        print("18.SceneDelegate sceneDidEnterBackground")
    }


}

