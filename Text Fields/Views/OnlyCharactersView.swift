//
//  OnlyCharactersView.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 31.01.2023.
//
import Foundation
import UIKit

@IBDesignable
class OnlyCharactersView: UIView {
    
    @IBOutlet weak var onlyCharactersTextField: UITextField!
    private let textFieldConfigurator = TextValidation()
    
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
        let nib = UINib(nibName: "OnlyCharactersView", bundle: bundle)
        
        if let nibInstantiate = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return nibInstantiate
        }
        return UIView()
    }
    
    func permission(string: String) -> String {
        
        textFieldConfigurator.transform(string, to: "wwwww-ddddd")
    }
    
    @IBAction func onlyCharactersTextFieldAction(_ sender: UITextField) {
        
        onlyCharactersTextField.text = permission(string: onlyCharactersTextField.text ?? "")
    }
    
}


extension OnlyCharactersView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onlyCharactersTextField.resignFirstResponder()
        return true
    }
}
