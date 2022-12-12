//
//  ZZColor.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZColor: NSObject {

    public class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    public class func create(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, tvOS 13.0, *) {
            return UIColor(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
        } else {
            return UIColor(cgColor: light.cgColor)
        }
    }

    public class func image(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // MARK: modal

    public class var modal: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.4),
            dark: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.6)
        )
    }
    
    // MARK: label

    public class var label: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 1),
            dark: ZZColor.rgba(red: 255, green: 255, blue: 255, alpha: 1)
        )
    }

    // MARK: secondaryLabel

    public class var secondaryLabel: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 60, green: 60, blue: 67, alpha: 0.6),
            dark: ZZColor.rgba(red: 235, green: 235, blue: 245, alpha: 0.6)
        )
    }

    // MARK: tertiaryLabel

    public class var tertiaryLabel: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 60, green: 60, blue: 67, alpha: 0.3),
            dark: ZZColor.rgba(red: 235, green: 235, blue: 245, alpha: 0.3)
        )
    }

    // MARK: quaternaryLabel

    public class var quaternaryLabel: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 60, green: 67, blue: 67, alpha: 0.18),
            dark: ZZColor.rgba(red: 235, green: 235, blue: 245, alpha: 0.18)
        )
    }

    // MARK: background

    public class var background: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 255, blue: 255, alpha: 1),
            dark: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 1)
        )
    }

    // MARK: secondarBackground

    public class var secondarBackground: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 239, green: 239, blue: 239, alpha: 1),
            dark: ZZColor.rgba(red: 28, green: 28, blue: 30, alpha: 1)
        )
    }

    // MARK: tertiaryBackground

    public class var tertiaryBackground: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 255, blue: 255, alpha: 1),
            dark: ZZColor.rgba(red: 44, green: 44, blue: 46, alpha: 1)
        )
    }

    // MARK: groupedBackground

    public class var groupedBackground: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 239, green: 239, blue: 239, alpha: 1),
            dark: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 1)
        )
    }

    // MARK: secondaryGrouped

    public class var secondaryGroupedBackground: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 255, blue: 255, alpha: 1),
            dark: ZZColor.rgba(red: 28, green: 28, blue: 28, alpha: 1)
        )
    }

    // MARK: tertiaryGroupedBackground

    public class var tertiaryGroupedBackground: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 198, green: 198, blue: 200, alpha: 1),
            dark: ZZColor.rgba(red: 44, green: 44, blue: 46, alpha: 1)
        )
    }

    // MARK: separator

    public class var separator: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 210, green: 210, blue: 210, alpha: 1),
            dark: ZZColor.rgba(red: 56, green: 56, blue: 58, alpha: 1)
        )
    }

    // MARK: systemRed

    public class var systemRed: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 59, blue: 48, alpha: 1),
            dark: ZZColor.rgba(red: 255, green: 69, blue: 58, alpha: 1)
        )
    }

    // MARK: systemOrange

    public class var systemOrange: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 149, blue: 0, alpha: 1),
            dark: ZZColor.rgba(red: 255, green: 159, blue: 0, alpha: 1)
        )
    }

    // MARK: systemYellow

    public class var systemYellow: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 204, blue: 0, alpha: 1),
            dark: ZZColor.rgba(red: 255, green: 214, blue: 0, alpha: 1)
        )
    }

    // MARK: systemGreen

    public class var systemGreen: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 52, green: 199, blue: 89, alpha: 1),
            dark: ZZColor.rgba(red: 48, green: 209, blue: 88, alpha: 1)
        )
    }

    // MARK: systemMint

    public class var systemMint: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 0, green: 199, blue: 190, alpha: 1),
            dark: ZZColor.rgba(red: 99, green: 230, blue: 226, alpha: 1)
        )
    }

    // MARK: systemTeal

    public class var systemTeal: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 48, green: 176, blue: 199, alpha: 1),
            dark: ZZColor.rgba(red: 64, green: 200, blue: 224, alpha: 1)
        )
    }

    // MARK: systemCyan

    public class var systemCyan: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 50, green: 173, blue: 230, alpha: 1),
            dark: ZZColor.rgba(red: 100, green: 210, blue: 255, alpha: 1)
        )
    }

    // MARK: systemBlue

    public class var systemBlue: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 0, green: 122, blue: 255, alpha: 1),
            dark: ZZColor.rgba(red: 10, green: 132, blue: 255, alpha: 1)
        )
    }

    // MARK: systemIndigo

    public class var systemIndigo: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 88, green: 86, blue: 214, alpha: 1),
            dark: ZZColor.rgba(red: 94, green: 92, blue: 230, alpha: 1)
        )
    }

    // MARK: systemPurple

    public class var systemPurple: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 175, green: 82, blue: 222, alpha: 1),
            dark: ZZColor.rgba(red: 191, green: 90, blue: 242, alpha: 1)
        )
    }

    // MARK: systemPink

    public class var systemPink: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 255, green: 45, blue: 85, alpha: 1),
            dark: ZZColor.rgba(red: 255, green: 55, blue: 95, alpha: 1)
        )
    }

    // MARK: systemBrown

    public class var systemBrown: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 162, green: 132, blue: 94, alpha: 1),
            dark: ZZColor.rgba(red: 172, green: 142, blue: 104, alpha: 1)
        )
    }

    // MARK: systemWhite

    public class var systemWhite: UIColor {
        return ZZColor.rgba(red: 255, green: 255, blue: 255, alpha: 1)
    }

    // MARK: systemGrey

    public class var systemGrey: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 142, green: 142, blue: 147, alpha: 1),
            dark: ZZColor.rgba(red: 142, green: 142, blue: 147, alpha: 1)
        )
    }

    // MARK: systemGrey2

    public class var systemGrey2: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 174, green: 174, blue: 178, alpha: 1),
            dark: ZZColor.rgba(red: 99, green: 99, blue: 102, alpha: 1)
        )
    }

    // MARK: systemGrey3

    public class var systemGrey3: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 199, green: 199, blue: 204, alpha: 1),
            dark: ZZColor.rgba(red: 72, green: 72, blue: 74, alpha: 1)
        )
    }

    // MARK: systemGrey4

    public class var systemGrey4: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 209, green: 209, blue: 214, alpha: 1),
            dark: ZZColor.rgba(red: 58, green: 58, blue: 60, alpha: 1)
        )
    }

    // MARK: systemGrey5

    public class var systemGrey5: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 229, green: 229, blue: 234, alpha: 1),
            dark: ZZColor.rgba(red: 44, green: 44, blue: 46, alpha: 1)
        )
    }

    // MARK: systemGrey6

    public class var systemGrey6: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 242, green: 242, blue: 247, alpha: 1),
            dark: ZZColor.rgba(red: 28, green: 28, blue: 30, alpha: 1)
        )
    }

    // MARK: systemBlack

    public class var systemBlack: UIColor {
        return ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 1)
    }

    // MARK: systemModal

    public class var systemModal: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.4),
            dark: ZZColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.6)
        )
    }

    // MARK: fill

    public class var fill: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 120, green: 120, blue: 128, alpha: 0.2),
            dark: ZZColor.rgba(red: 120, green: 120, blue: 128, alpha: 0.36)
        )
    }

    // MARK: secondaryFill

    public class var secondaryFill: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 120, green: 120, blue: 128, alpha: 0.16),
            dark: ZZColor.rgba(red: 120, green: 120, blue: 128, alpha: 0.32)
        )
    }

    // MARK: tertiaryFill

    public class var tertiaryFill: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 118, green: 118, blue: 128, alpha: 0.12),
            dark: ZZColor.rgba(red: 118, green: 118, blue: 128, alpha: 0.24)
        )
    }

    // MARK: quaternaryFill

    public class var quaternaryFill: UIColor {
        return ZZColor.create(
            light: ZZColor.rgba(red: 116, green: 116, blue: 128, alpha: 0.08),
            dark: ZZColor.rgba(red: 116, green: 116, blue: 128, alpha: 0.16)
        )
    }
}
