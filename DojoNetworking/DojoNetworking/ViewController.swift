//
//  ViewController.swift
//  DojoNetworking
//
//  Created by Leandro Luquetti on 24/09/19.
//  Copyright © 2019 Leandro Luquetti. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var socket: URLSessionWebSocketTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openConnection()
    }

    @IBAction func vaiAction() {
        socket?.send(URLSessionWebSocketTask.Message.string(textField.text!), completionHandler: { (error) in
            print(error)
        })
    }
    
    func openConnection() {
        var urlSession = URLSession.init(configuration: .default, delegate: nil, delegateQueue: nil)
        socket = urlSession.webSocketTask(with: URL(string: "wss://echo.websocket.org")!)
        socket?.resume()
        socket?.receive(completionHandler: { (result) in
            switch result {
            case .success(let valor):
                switch valor {
                case .data(_):
                    print("data")
                case .string(let texto):
                    print(texto)
                @unknown default:
                    print("bla")
                }
            case .failure(_):
                print("deu ruim")
            }
        })
        
        ping()
    }
    
    func ping() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.socket?.sendPing(pongReceiveHandler: { error in
                self.ping()
                print("Send Ping \(error)")
            })
        }
    }
}

