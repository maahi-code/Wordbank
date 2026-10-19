//
//  ThinLinearProgressBar.swift
//  Wordbank
//
//  Created by Mahipal Singh on 12/10/26.
//

import SwiftUI

struct ThinLinearProgressBar: View {
    var value: Double
    var total: Double
    var height: CGFloat = 2.0
    var accentColor: Color = .accentColor
    var trackColor: Color = Color(.systemGray5)
    
    private var progress: CGFloat {
        guard total > 0 else { return 0 }
        return min(max(CGFloat(value / total), 0.0), 1.0)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                // Background Track
                Rectangle()
                    .fill(trackColor)
                    .frame(height: height)
                
                Rectangle()
                    .fill(accentColor)
                    .frame(width: proxy.size.width * progress, height: height)
                    .animation(.easeInOut(duration: 0.3), value: progress)
            }
        }
        .frame(height: height)
    }
}

#Preview {
    ThinLinearProgressBar(value: 0.2, total: 1.0)
}
