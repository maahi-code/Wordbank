//
//  Haptics.swift
//  Wordbank
//
//  Created by Mahipal Singh on 17/09/26.
//


import AVFoundation
import CoreHaptics
import UIKit

@MainActor
enum Haptics {
    enum ImpactStyle {
        case light
        case medium
        case heavy
        case soft
        case rigid

        fileprivate var feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle {
            switch self {
            case .light:
                .light
            case .medium:
                .medium
            case .heavy:
                .heavy
            case .soft:
                .soft
            case .rigid:
                .rigid
            }
        }
    }

    enum NotificationStyle {
        case success
        case warning
        case error

        fileprivate var feedbackType: UINotificationFeedbackGenerator.FeedbackType {
            switch self {
            case .success:
                .success
            case .warning:
                .warning
            case .error:
                .error
            }
        }
    }

    static func impact(_ style: ImpactStyle = .medium, intensity: CGFloat = 1.0) {
        let generator = UIImpactFeedbackGenerator(style: style.feedbackStyle)
        generator.prepare()
        generator.impactOccurred(intensity: intensity)
    }

    static func notification(_ style: NotificationStyle) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(style.feedbackType)
    }

    static func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }

    static func buttonTap() {
        impact(.light, intensity: 0.7)
    }

    static func primaryAction() {
        impact(.medium)
    }

    static func success() {
        notification(.success)
    }

    static func error() {
        notification(.error)
    }
}