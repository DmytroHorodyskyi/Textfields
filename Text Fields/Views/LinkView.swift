//
//  LinkView.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 31.01.2023.
//
import UIKit
import SafariServices

protocol LinkViewDelegate {
    func openSafariVC(with url: URL)
}

@IBDesignable
class LinkView: UIView, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var linkTextField: UITextField!
    var delegate: LinkViewDelegate?
    
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
        
        guard !string.isEmpty, string.count > 1, string.hasPrefix("http://") || string.hasPrefix("https://"), let url = URL(string: string) else {return false}
        delegate?.openSafariVC( with: url)
        return true
    }
}
