//
//  NoDigitsFieldView.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 31.01.2023.
//

import UIKit

@IBDesignable
class NoDigitsFieldView: UIView {
    
    @IBOutlet weak var noDigitsTextField: UITextField!
    
    private let viewController = ViewController()
    
    
    
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
        let nib = UINib(nibName: "NoDigitsFieldView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first! as! UIView
    }
    
    
    
    @IBAction func noDigitsTextFieldAction(_ sender: UITextField) {
        noDigitsTextField.text = noDigitsTextField.text!.components(separatedBy: CharacterSet.decimalDigits).joined()
    }
    
    
}

extension NoDigitsFieldView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        noDigitsTextField.resignFirstResponder()
        return true
    }
}
