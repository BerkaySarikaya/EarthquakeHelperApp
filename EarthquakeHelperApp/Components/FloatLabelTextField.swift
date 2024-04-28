//
//  FloatLabelTextField.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 17.11.2023.
//

import UIKit


public class FloatLabelTextField: UITextField {
    private let titleLabel = UILabel()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    public var title: String? {
        willSet {
            attributedPlaceholder = nil
            titleLabel.text = newValue
            titleLabel.sizeToFit()
            updateTitlePosition()
        }
    }
    public var leftImage: UIImage? {
        willSet {
            if let image = newValue {
                imageView.image = image.withRenderingMode(.alwaysTemplate)
                leftView = imageView
                leftViewMode = .always
            } else {
                imageView.image = nil
                leftView = nil
                leftViewMode = .never
            }
        }
    }
    private var insets: UIEdgeInsets {
        var insets = UIEdgeInsets(top: 29, left: 15, bottom: 12, right: 15)
        if let leftView = leftView {
            insets.left += leftView.frame.size.width + 10
        }
        return insets
    }
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x = 15
        rect.origin.y = 21
        return rect
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        if text?.isEmpty == true {
            setTitleToCenter(animate: false)
        } else {
            setTitleToTop(animate: false)
        }
        layer.borderColor = isFirstResponder ? UIColor.red.cgColor : UIColor.systemBlue.cgColor
    }
    private func configureContents() {
        addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        borderStyle = .none
        layer.borderWidth = 2
        layer.cornerRadius = 4
        layer.borderColor = UIColor.systemBlue.cgColor
        font = .systemFont(ofSize: 14, weight: .semibold)
        textColor = .black
        titleLabel.textColor = .systemTeal
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.backgroundColor = .white
        titleLabel.layer.cornerRadius = 4
        titleLabel.clipsToBounds = true
        titleLabel.frame.origin.y = (frame.size.height / 2) - (titleLabel.frame.size.height / 2)
        titleLabel.isHidden = true
    }
    private func updateTitlePosition() {
        titleLabel.frame.origin.x = insets.left
        titleLabel.frame.size.width = frame.size.width - insets.left - insets.right
    }
    
    private func setTitleToTop(animate: Bool) {
        let animationDuration: TimeInterval = animate ? 0.3 : 0
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -self.titleLabel.frame.size.height / 2)
            self.titleLabel.isHidden = false
        }, completion: nil)
    }
    
    private func setTitleToCenter(animate: Bool) {
        let animationDuration: TimeInterval = animate ? 0.3 : 0
        UIView.animate(withDuration: animationDuration, delay: 0, options: .curveEaseOut, animations: {
            self.titleLabel.transform = .identity
            self.titleLabel.isHidden = true
        }, completion: nil)
    }
}
