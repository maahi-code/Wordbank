//
//  NewWordView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 24/09/26.
//

import SwiftUI

struct NewWordView: View {
    @Environment(\.dismiss) private var dismiss
    var onSave: (VocabularyEntry) -> Void
    @State private var word: String = ""
    @State private var definition: String = ""
    @State private var note: String = ""
    
    @FocusState private var focusedField: NewWordField?
    

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        Text("New word")
                            .font(.system(size: 36, weight: .regular, design: .serif))
                            .foregroundStyle(.primary)
                            .padding(.top, 24)
                        
                        VStack(spacing: 28) {
                            UnderlinedTextField(
                                label: "WORD",
                                placeholder: "Enter word",
                                text: $word,
                                focusValue: .word,
                                focusedField: $focusedField,
                                accentColor: .brandInk.opacity(0.5)
                            )
                            
                            UnderlinedTextField(
                                label: "DEFINITION — IN YOUR OWN WORDS",
                                placeholder: "What does it mean to you?",
                                text: $definition,
                                focusValue: .definition,
                                focusedField: $focusedField,
                                accentColor: .brandInk.opacity(0.5),
                                isMultiline: true
                            )
                            
                            UnderlinedTextField(
                                label: "NOTE — OPTIONAL",
                                placeholder: "Where did you meet this word?",
                                text: $note,
                                focusValue: .note,
                                focusedField: $focusedField,
                                accentColor: .brandInk.opacity(0.5)
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                }
                .scrollDismissesKeyboard(.interactively)
                
                VStack(spacing: 12) {
                    Button {
                        onSavePressed()
                    }label:  {
                        Text("Save word")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle((word.isEmpty || definition.isEmpty) ? .brandInk.opacity(0.4): .white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54)
                            .background(
                                (word.isEmpty || definition.isEmpty) ? .brandInk.opacity(0.2) : Color.accentColor
                            )
                            .clipShape(Capsule())
                    }
                    .disabled(word.isEmpty || definition.isEmpty)
                    
                    Text("A word and your own definition are needed")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(Color(.secondaryLabel))
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
            .background(Color(.systemBackground))
            .onAppear {
                focusedField = .word
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.brandInk.opacity(0.7))
                }
            }
        }
        
    }
    
    private func onSavePressed() {
        Haptics.buttonTap()
        let newEntry = VocabularyEntry(
            term: word.trimmingCharacters(in: .whitespacesAndNewlines),
            definition: definition.trimmingCharacters(in: .whitespacesAndNewlines),
            partOfSpeech: .noun,
            syllabification: word.trimmingCharacters(in: .whitespacesAndNewlines),
            note: note.trimmingCharacters(in: .whitespacesAndNewlines),
            reviewCount: 0,
            addedDate: .now,
            lastSeenDate: .now,
            isMastered: false
        )
        
        onSave(newEntry)
        dismiss()
    }
}

#Preview {
    NewWordView(onSave: {_ in })
}
