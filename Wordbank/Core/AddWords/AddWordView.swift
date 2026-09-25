//
//  AddWordView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 24/09/26.
//

import SwiftUI

struct AddWordView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 30) {
                    Text("New Word")
                         .primaryTextStyle()
                         .font(.title)
                         .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("WORD")
                        .fontDesign(.rounded)
                        .kerning(0.5)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.brandInk.opacity(0.3))
                    
                    
                }
                .padding()
                
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        onDismissPressed()
                    }label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            
        }
    }
    
    private func onDismissPressed() {
        Haptics.buttonTap()
        self.dismiss()
    }
}

#Preview {
    AddWordView()
}
