//
//  FontExt.swift
//  Wordbank
//
//  Created by Mahipal Singh on 06/09/26.
//
import SwiftUI

extension Font {

    enum Newsreader: String {
        case light = "Newsreader24pt-Light"
        case regular = "Newsreader24pt-Regular"
        case medium = "Newsreader24pt-Medium"
        case semibold = "Newsreader24pt-SemiBold"
        case italic = "Newsreader24pt-Italic"
    }

    enum InstrumentSans: String {
        case regular = "InstrumentSans-Regular"
        case medium = "InstrumentSans-Medium"
        case semibold = "InstrumentSans-SemiBold"
    }

    static func newsreader(
        _ weight: Newsreader = .regular,
        size: CGFloat,
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        .custom(weight.rawValue, size: size, relativeTo: textStyle)
    }

    static func instrumentSans(
        _ weight: InstrumentSans = .regular,
        size: CGFloat,
        relativeTo textStyle: TextStyle = .body
    ) -> Font {
        .custom(weight.rawValue, size: size, relativeTo: textStyle)
    }

    static let brandDisplay = newsreader(.regular, size: 34, relativeTo: .largeTitle)
    static let brandTitle = newsreader(.medium, size: 22, relativeTo: .title2)
    static let brandWord = newsreader(.regular, size: 28, relativeTo: .title)
    static let brandQuote = newsreader(.italic, size: 17, relativeTo: .body)

    static let brandBody = instrumentSans(.regular, size: 17, relativeTo: .body)
    static let brandLabel = instrumentSans(.medium, size: 13, relativeTo: .footnote)
    static let brandCaption = instrumentSans(.regular, size: 12, relativeTo: .caption)
}
