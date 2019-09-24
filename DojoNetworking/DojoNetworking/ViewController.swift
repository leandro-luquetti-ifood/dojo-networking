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
    }

    @IBAction func vaiAction() {
        print(textField.text!)
    }
    
    func openConnection() {
        var urlSession = URLSession.init(configuration: .default, delegate: nil, delegateQueue: nil)
        socket = urlSession.webSocketTask(with: URL(string: "ws://localhost:8080")!)
        socket.
    }
}

