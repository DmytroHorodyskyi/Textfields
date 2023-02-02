//
//  ViewController.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 30.01.2023.
//

import UIKit
import SafariServices

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

