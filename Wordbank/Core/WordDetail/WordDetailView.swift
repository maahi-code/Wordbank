//
//  WordDetailView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 18/09/26.
//

import SwiftUI

struct WordDetailView: View {
    @Binding var entry: VocabularyEntry
    var onDelete: () -> Void
    @Environment(\.dismiss) var dismiss
    @State private var showDeleteConfirmation = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(entry.term)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .primaryTextStyle()
                    
                    
                    HStack {
                        Text(entry.partOfSpeech.rawValue)
                        Circle()
                            .frame(width: 3)
                        Text(entry.syllabification)
                    }
                    .fontWeight(.light)
                    .italic()
                    .fontDesign(.serif)
                    .kerning(0.5)
                    .foregroundStyle(.brandInk.opacity(0.6))
                }
                
                Text(entry.definition)
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
                
                
                Text(entry.note)
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
                    Text(entry.reviewCount, format: .number)
                        .primaryTextStyle()
                        .font(.title)
                        .foregroundStyle(.brandInk)
                    
                    Text("Review")
                        .font(.subheadline)
                        .foregroundStyle(.brandInk.opacity(0.5))
                }
                VStack(alignment: .leading) {
                    Text(
                        entry.addedDate,
                        format: .dateTime
                            .day()
                            .month(.abbreviated)
                    )
                        .primaryTextStyle()
                        .font(.title)
                        .foregroundStyle(.brandInk)
                    
                    Text("added")
                        .font(.subheadline)
                        .foregroundStyle(.brandInk.opacity(0.5))
                }
                VStack(alignment: .leading) {
                    Text(
                        entry.lastSeenDate,
                        format: .relative(
                            presentation: .numeric,
                            unitsStyle: .abbreviated
                        )
                    )
                        .primaryTextStyle()
                        .font(.title)
                        .foregroundStyle(.brandInk)
                    
                    Text("last seen")
                        .font(.subheadline)
                        .foregroundStyle(.brandInk.opacity(0.5))
                }
            }
            
            Spacer()
            
            Button {
                onMarkPressed()
            }label: {
                Text(entry.isMastered ? "Unmarked" : "Mark as mastered")
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
       
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Delete", role: .destructive) {
                    showDeleteConfirmation = true
                }
                .foregroundStyle(.red)
                
                .confirmationDialog("", isPresented: $showDeleteConfirmation, actions: {
                    Button("Delete \"\(entry.term)\"", role: .destructive) {
                        onDeletePressed()
                    }
                    Button("Cancel", role: .cancel) { }
                }, message: {
                    Text("Are you sure you want to delete this word? This action cannot be undone.")
                })
            }
        }
    }
    
    private func onMarkPressed() {
        Haptics.buttonTap()
        entry.isMastered.toggle()
        self.dismiss()
    }
    private func onDeletePressed() {
        Haptics.buttonTap()
        onDelete()
        self.dismiss()
    }
}

#Preview {
    NavigationStack {
        WordDetailView(
            entry: .constant(VocabularyEntry.mockEntries[0]),
            onDelete: {}
        )
    }
}
