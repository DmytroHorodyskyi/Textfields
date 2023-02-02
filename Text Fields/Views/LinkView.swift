//
//  LinkView.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 31.01.2023.
//
import UIKit
import SafariServices

@IBDesignable
class LinkView: UIView, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var linkTextField: UITextField!
    var mainViewController = MainViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        let xibView = loadViewFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }
    
    private func loadViewFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LinkView", bundle: bundle)
        
        if let nibInstantiate = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return nibInstantiate
        }
        return UIView()
    }
}


extension LinkView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        linkTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.count > 1 {
            if let url = URL(string: string) {
                let vc = SFSafariViewController(url: url)
                vc.delegate = self
                
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController.present(vc, animated: true, completion: nil)
                }
                
            }
            return true
        }
        return true
    }
}

