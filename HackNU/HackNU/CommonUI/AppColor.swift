//
//  AppColor.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit

public protocol AppColorProtocol {
    var rawValue: String { get }
}

public extension AppColorProtocol {
    var uiColor: UIColor {
        guard let color = UIColor(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return color
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

public enum AppColor: String, AppColorProtocol {
    case lineUnderNav
    case podiumBackground
    case firstPlace1
    case firstPlace2
    case secondPlace1
    case secondPlace2
    case thirdPlace1
    case thirdPlace2
    case currentRatingUser
    case level_rect
    case levelColor
    case flowkitBlue
    case progress_unfinished_color
    case nextLevelColor
    case grayDivider
    case statBackground
    case darktext
    case graytext
    case grayDash
    case statsBorder
    case emptyAchievements
    case allAchievements
    case blueRoundAchievement
    case nonAchievedLabel
}
