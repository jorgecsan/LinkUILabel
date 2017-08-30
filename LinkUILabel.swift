//
//  LinkUILabel.swift
//  Parc
//
//  Created by Jorge Cordero Sanchez on 18/5/17.
//  Copyright © 2017 Jorge Cordero Sanchez. All rights reserved.
//

import UIKit

@IBDesignable
class LinkUILabel: UILabel{
    
    @IBInspectable
    var url: String?{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onLabelClic(sender:)))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(tap)
        }
    }
    
    override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.characters.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect)
        // Tap serviceConditions handler
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onLabelClic(sender:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    private func openUrl(urlString: String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func onLabelClic(sender:UITapGestureRecognizer) {
        self.openUrl(urlString: url)
    }
}
