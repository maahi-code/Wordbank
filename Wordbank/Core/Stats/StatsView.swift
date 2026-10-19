//
//  StatsView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Stats")
                    .font(.largeTitle)
                    .primaryTextStyle()
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("6")
                        .font(.system(size: 50))
                        .fontWeight(.semibold)
                        .foregroundStyle(.brandPrimary)
                        .fontDesign(.monospaced)
                        
                    
                    Text("words added this week")
                        .foregroundStyle(.brandInk.opacity(0.6))
                        .fontDesign(.rounded)
                        .kerning(0.4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("4")
                        .font(.system(size: 50))
                        .fontWeight(.semibold)
                        .foregroundStyle(.brandInk)
                        .fontDesign(.monospaced)

                    Text("word mastered, of 8 saved")
                        .foregroundStyle(.brandInk.opacity(0.6))
                        .fontDesign(.rounded)
                        .kerning(0.4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .center) {
                        Text("6")
                            .font(.system(size: 50))
                            .fontWeight(.semibold)
                            .foregroundStyle(.brandInk)
                            .fontDesign(.monospaced)
                        Text("days")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundStyle(.secondary)
                            .padding(.top)
                            .fontDesign(.serif)
                    }
                    
                    Text("current review streak")
                        .foregroundStyle(.brandInk.opacity(0.6))
                        .fontDesign(.rounded)
                        .kerning(0.4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                ReviewsPerDayChart()
                
                Spacer()
                
            }
            .padding()
            
        }
    }
}

#Preview {
    StatsView()
}
