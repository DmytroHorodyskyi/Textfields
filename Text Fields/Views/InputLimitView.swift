//
//  InputLimitView.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 31.01.2023.
//
import Foundation
import UIKit

@IBDesignable
class InputLimitView: UIView {
    
    @IBOutlet weak var inputLimitTextField: UITextField!
    @IBOutlet weak var countDownOfLimitTextField: UILabel!
    
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
        let nib = UINib(nibName: "InputLimitView", bundle: bundle)
        
        if let nibInstantiate = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return nibInstantiate
        }
        return UIView()
    }
    
    func setBlackColorFirstTenDigits() {
        let mainString: String = inputLimitTextField.text ?? ""
        let stringToColor = mainString.prefix(10)
        let range = (mainString as NSString).range(of: String(stringToColor))
        let attributedString = NSMutableAttributedString(string:mainString)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range)
        inputLimitTextField.attributedText = attributedString
    }
    
    func changeInputLimitTFAppearance() {
        guard let countOfChars = inputLimitTextField.text?.count else { return }
        countDownOfLimitTextField.text = String( 10 - countOfChars)
        
        if Int(countDownOfLimitTextField.text ?? "") ?? 0 < 0 {
            countDownOfLimitTextField.textColor = UIColor.red
            inputLimitTextField.layer.borderWidth = 1
            inputLimitTextField.layer.cornerRadius = 7
            inputLimitTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            countDownOfLimitTextField.textColor = UIColor.gray
            inputLimitTextField.layer.borderColor = UIColor(white: 0, alpha: 0).cgColor
            inputLimitTextField.borderStyle = .roundedRect
        }
    }
    
    
    @IBAction func inputLimitTextFieldAction(_ sender: UITextField) {
        setBlackColorFirstTenDigits()
        changeInputLimitTFAppearance()
    }
}


extension InputLimitView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputLimitTextField.resignFirstResponder()
        return true
    }
}
