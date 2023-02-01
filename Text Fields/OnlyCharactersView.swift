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
        return nib.instantiate(withOwner: self, options: nil).first! as! UIView
    }
    
    
    
    
    func permission(string: String) -> String {
        
        var changingString = string
        var result = String("")
        let mask = "wwwww-dddddd"
        
        for symbol in mask {
            
            if changingString == "" {
                break
            }
            
            let firstChar = changingString[changingString.startIndex]
            
            if symbol == "w" && firstChar.isLetter {
                result += String(firstChar)
                changingString.removeFirst()
                
            } else if symbol == "d" && firstChar.isNumber {
                result += String(firstChar)
                changingString.removeFirst()
                
            } else if symbol == "-"{
                result += String(symbol)
                //changingString.removeFirst()
            } else {
                changingString.removeFirst()
            }
            
        }
        return result
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
