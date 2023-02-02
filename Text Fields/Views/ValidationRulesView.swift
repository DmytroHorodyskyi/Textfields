//
//  ValidationRulesView.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 31.01.2023.
//

import UIKit

@IBDesignable
class ValidationRulesView: UIView {
    
    private enum LabelState {
        case confirmedLabel
        case unConfirmedLabel
    }
    
    @IBOutlet weak var validationRulesTextField: UITextField!
    @IBOutlet weak var minLength8Label: UILabel!
    @IBOutlet weak var min1DigitLabel: UILabel!
    @IBOutlet weak var min1LowercaseLabel: UILabel!
    @IBOutlet weak var min1CapitalLabel: UILabel!
    @IBOutlet weak var passwordStrengthProgress: UIProgressView!
 
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
        let nib = UINib(nibName: "ValidationRulesView", bundle: bundle)
        
        if let nibInstantiate = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            return nibInstantiate
        }
        return UIView()
    }
    
    private func setProgressView(progress: Float?, progressTintColor: UIColor?) {
        passwordStrengthProgress.progress = progress ?? 0
        passwordStrengthProgress.progressTintColor = progressTintColor
    }
    
    private func setLabel(_ label: UILabel, state: LabelState ) {
        switch state {
        case .confirmedLabel:
            if let labelText = label.text {
                label.text = "V" + labelText.dropFirst()
            }
            label.textColor = UIColor.green
        case .unConfirmedLabel:
            if let labelText = label.text {
                label.text = "-" + labelText.dropFirst()
            }
            label.textColor = UIColor.black
        }
    }
    
    private func setStrengthProgress(countOfFollowedRules count: Int) {
        switch count {
        case 1:
            setProgressView(progress: 0.25, progressTintColor: UIColor.red)
        case 2:
            setProgressView(progress: 0.5, progressTintColor: UIColor.orange)
        case 3:
            setProgressView(progress: 0.75, progressTintColor: UIColor.yellow)
        case 4:
            setProgressView(progress: 1, progressTintColor: UIColor.green)
        default:
            setProgressView(progress: 0, progressTintColor: UIColor.white)
            
        }
    }
    
    @IBAction func validationRulesTextFieldAction(_ sender: UITextField) {
        
        var counterOfRules = 0
        
        if let password = validationRulesTextField.text {
            
            if password.count >= 8{
                setLabel(minLength8Label, state: .confirmedLabel)
                counterOfRules += 1
            } else {
                setLabel(minLength8Label, state: .unConfirmedLabel)
            }
            
            if password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
                setLabel(min1DigitLabel, state: .confirmedLabel)
                counterOfRules += 1
            } else {
                setLabel(min1DigitLabel, state: .unConfirmedLabel)
            }
            
            if password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil {
                setLabel(min1LowercaseLabel, state: .confirmedLabel)
                counterOfRules += 1
            } else {
                setLabel(min1LowercaseLabel, state: .unConfirmedLabel)
            }
            
            if password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil {
                setLabel(min1CapitalLabel, state: .confirmedLabel)
                counterOfRules += 1
            } else {
                setLabel(min1CapitalLabel, state: .unConfirmedLabel)
            }
            setStrengthProgress(countOfFollowedRules: counterOfRules)
        }
    }
}


extension ValidationRulesView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validationRulesTextField.resignFirstResponder()
        return true
    }
}
