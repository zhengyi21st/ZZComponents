//
//  ZZFont.swift
//  ZZComponents
//
//  Created by Ethan on 2022/9/22.
//  Copyright © 2022 ZZComponents. All rights reserved.
//

import UIKit

open class ZZFont: NSObject {

   public static var largeTitleSize: CGFloat = 34.0
   public static var title1Size: CGFloat = 28.0
   public static var title2Size: CGFloat = 22.0
   public static var title3Size: CGFloat = 20.0
   public static var headlineSize: CGFloat = 17.0
   public static var bodySize: CGFloat = 17.0
   public static var calloutSize: CGFloat = 16.0
   public static var subheadlineSize: CGFloat = 15.0
   public static var footnoteSize: CGFloat = 13.0
   public static var caption1Size: CGFloat = 12.0
   public static var caption2Size: CGFloat = 11.0

    public class func largeTitle(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .largeTitle)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: largeTitleSize, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func title1(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .title1)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: title1Size, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func title2(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .title2)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: title2Size, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func title3(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .title3)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: title3Size, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func headline(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .headline)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: headlineSize, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func body(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .body)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: bodySize, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func callout(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .callout)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: calloutSize, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func subheadline(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .subheadline)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: subheadlineSize, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func footnote(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .footnote)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: footnoteSize, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func caption1(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .caption1)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: caption1Size, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }

    public class func caption2(weight: UIFont.Weight = .regular) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: .caption2)
        let font = metrics.scaledFont(for: UIFont.systemFont(ofSize: caption2Size, weight: weight), compatibleWith: UITraitCollection(preferredContentSizeCategory: .large))
        return font
    }
}
