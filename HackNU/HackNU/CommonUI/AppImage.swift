//
//  AppImage.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import UIKit

public protocol AppImageProtocol {
    var rawValue: String { get }
}

public extension AppImageProtocol {
    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

public enum AppImage: String, AppImageProtocol {
    case kiizui
    case orna
    case flag
    case book
    case ecology_clean_battery = "ecology-clean-battery"
    case sandtimer
    case dashedRectangle
    case leaves
    case handAchieve
    case firstSalemAchieve
    case kozKorkakAchieve
    case unavailableachievement1
    case unavailableachievement2
    case unavailableachievement3
}
