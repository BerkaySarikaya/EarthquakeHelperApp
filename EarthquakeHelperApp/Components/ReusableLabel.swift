//
//  ReusableLabel.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 17.11.2023.
//

import UIKit

class ReusableLabel: UILabel {
    enum LabelTypeEnum {
        case font1
    }
    enum ColorStyle {
        case black
        case gray
        case purple
        case teal
        case magenta
        case orange
    }
    public private(set) var labelType: LabelTypeEnum
    public private(set) var labelText: String
    public private(set) var labelColor: ColorStyle
    init(labelText: String, labelType: LabelTypeEnum, labelColor: ColorStyle) {
        self.labelText = labelText
        self.labelType = labelType
        self.labelColor = labelColor
        super.init(frame: .zero)
        self.configureLabelStyle()
        self.configureLabelColor()
        self.configureLabelColor()
        self.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSMutableAttributedString(string: labelText)
        self.attributedText = attributedString
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureLabelColor() {
        switch labelColor {
        case .black:
            self.textColor = UIColor.black
        case .gray:
            self.textColor = UIColor.gray
        case .purple:
            self.textColor = UIColor.purple
        case .teal:
            self.textColor = UIColor.systemTeal
        case .magenta:
            self.textColor = .magenta
        case .orange:
            self.textColor = .orange
        }
    }
    private func configureLabelStyle() {
        switch labelType {
        case .font1:
            self.font = UIFont(name: "Inter", size: 10)
        }
    }
}
