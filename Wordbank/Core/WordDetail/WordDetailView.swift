//
//  WordDetailView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 18/09/26.
//

import SwiftUI

struct WordDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("meticulous")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .primaryTextStyle()
                    
                    
                    HStack {
                        Text("adjective")
                        Circle()
                            .frame(width: 3)
                        Text("me·tic·u·lous")
                    }
                    .fontWeight(.light)
                    .italic()
                    .fontDesign(.serif)
                    .kerning(0.5)
                    .foregroundStyle(.brandInk.opacity(0.6))
                }
                
                Text("very careful about small details, almost too careful")
                    .primaryTextStyle()
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
            }
           
            Rectangle()
                .fill(.brandInk.opacity(0.2))
                .frame(height: 1)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Your Note")
                    .textCase(.uppercase)
                    .fontDesign(.rounded)
                    .kerning(1.2)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brandInk.opacity(0.4))
                
                
                Text("From the review of the watch factory — “meticulous assembly by hand”. My manager used it about Dana's spreadsheets too, so it can be a compliment.")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                    .primaryTextStyle()
                    .foregroundStyle(.brandInk.opacity(0.75))
                    .font(.subheadline)
            }
            
            
            Rectangle()
                .fill(.brandInk.opacity(0.2))
                .frame(height: 1)
                .padding(.vertical)
            
            
            HStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("7")
                        .primaryTextStyle()
                        .font(.largeTitle)
                        .foregroundStyle(.brandInk)
                    
                    Text("reviews")
                        .font(.subheadline)
                        .foregroundStyle(.brandInk.opacity(0.5))
                }
                VStack(alignment: .leading) {
                    Text("12 Aug")
                        .primaryTextStyle()
                        .font(.largeTitle)
                        .foregroundStyle(.brandInk)
                    
                    Text("added")
                        .font(.subheadline)
                        .foregroundStyle(.brandInk.opacity(0.5))
                }
                VStack(alignment: .leading) {
                    Text("2d")
                        .primaryTextStyle()
                        .font(.largeTitle)
                        .foregroundStyle(.brandInk)
                    
                    Text("last seen")
                        .font(.subheadline)
                        .foregroundStyle(.brandInk.opacity(0.5))
                }
            }
            
            Spacer()
            
            Button {
                onMarkButtonPressed()
            }label: {
                Text("Mark as mastered")
                    .primaryTextStyle()
                    .foregroundStyle(.brandInk)
                    .font(.title3)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding()
                   
            }
            .buttonStyle(.glass)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .fullScreenBackground(.brandPaper)
    }
    
    private func onMarkButtonPressed() {
        Haptics.buttonTap()
        self.dismiss()
    }
}

#Preview {
    WordDetailView()
}
