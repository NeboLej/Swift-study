//
//  webSocketVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 09.11.2021.
//

import UIKit

class WebSocketVC:  UIViewController, UIApplicationDelegate, WebSocketConnectionDelegate {

    var webSocketConnection: WebSocketConnection!
    var decoder = JSONDecoder()
    lazy var label: UILabel = {
        var label = UILabel()
        label.text = ".........."
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bitcoin")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(imageView)
        initConstraint()
        
        webSocketConnection = WebSocketService(url: URL(string: "wss://ws.finnhub.io?token=c64lq5aad3idic8salcg")!)
        webSocketConnection.delegate = self
        webSocketConnection.connect()
        
        let string = "{"+"\"type\""+":"+"\"subscribe\""+","+"\"symbol\""+":"+"\"BINANCE:BTCUSDT\""+"}"
        webSocketConnection.send(text: string)
    }
    
    func initConstraint() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150)
        ])
    }
    
    
    func onConnected(connection: WebSocketConnection) {
        print("Connected")
    }
    
    func onDisconnected(connection: WebSocketConnection, error: Error?) {
        if let error = error {
            print("Disconnected with error:\(error)")
        } else {
            print("Disconnected normally")
        }
    }
    
    func onError(connection: WebSocketConnection, error: Error) {
        print("Connection error:\(error)")
    }
    
    func onMessage(connection: WebSocketConnection, text: String) {
        DispatchQueue.main.async {
            self.decode(text: text)
        }
    }
    func decode(text: String) {
        var response = ResponseModel(type: "", data: [])
        
        let data = text.data(using: .utf8)
        guard let data = data else {return}
        do {
            response = try decoder.decode(ResponseModel.self, from: data)
            changeLabel(text: String(response.data[0].price))
        } catch {
            print("JSON no DATA")
        }
    }
    
    func changeLabel(text: String) {
        label.text = text
    }
    
    func onMessage(connection: WebSocketConnection, data: Foundation.Data) {
        print("Data message: \(data)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        webSocketConnection.disconnect()
    }
}
