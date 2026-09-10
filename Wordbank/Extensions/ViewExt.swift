//
//  ViewExt.swift
//  Wordbank
//
//  Created by Mahipal Singh on 06/09/26.
//
import SwiftUI

extension View {

    func headword() -> some View {
        self
            .font(.brandWord)
            .foregroundStyle(Color(.brandInk))
    }

    func definition() -> some View {
        self
            .font(.brandQuote)
            .foregroundStyle(.secondary)
    }

    func metadataLabel() -> some View {
        self
            .font(.brandLabel)
            .textCase(.uppercase)
            .foregroundStyle(.secondary)
    }

    func brandSurface() -> some View {
        self
            .background(Color(.brandPaper))
            .foregroundStyle(Color(.brandInk))
    }
    
    func fullScreenBackground<S: ShapeStyle>(_ style: S) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Rectangle()
                    .fill(style)
                    .ignoresSafeArea()
            }
    }
    
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }
}
