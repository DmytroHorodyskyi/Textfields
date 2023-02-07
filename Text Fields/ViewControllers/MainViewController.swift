//
//  ViewController.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 30.01.2023.
//

import UIKit
import SafariServices

class MainViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var linkView: LinkView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linkView.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension MainViewController: LinkViewDelegate {
    
    func openSafariVC(with url: URL) {
        let vc = SFSafariViewController(url: url)
        self.present(vc, animated: true, completion: nil)
    }
}
