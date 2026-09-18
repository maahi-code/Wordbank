//
//  WordView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI

struct VocabularyEntry: Identifiable {
    let id = UUID()
    let term: String
    let definition: String
    var isSelected: Bool = false
    
    static let mockEntries: [VocabularyEntry] = [
        VocabularyEntry(term: "meticulous", definition: "very careful and precise about small details"),
        VocabularyEntry(term: "serendipity", definition: "the chance discovery of something valuable or delightful"),
        VocabularyEntry(term: "resilient", definition: "able to recover quickly from difficulty or change"),
        VocabularyEntry(term: "eloquent", definition: "fluent and persuasive in speaking or writing"),
        VocabularyEntry(term: "ephemeral", definition: "lasting for only a very short time"),
        VocabularyEntry(term: "pragmatic", definition: "focused on practical solutions and real-world results"),
        VocabularyEntry(term: "ambiguous", definition: "open to more than one possible meaning"),
        VocabularyEntry(term: "tenacious", definition: "persistent and unwilling to give up"),
        VocabularyEntry(term: "benevolent", definition: "kind, generous, and willing to help others"),
        VocabularyEntry(term: "nostalgia", definition: "a sentimental longing for a time or place in the past"),
        VocabularyEntry(term: "candid", definition: "honest and direct, even when the truth is difficult"),
        VocabularyEntry(term: "ubiquitous", definition: "present or appearing seemingly everywhere"),
    ]
}
struct WordView: View {
    @State private var entries = VocabularyEntry.mockEntries
    @State private var showWordDetailView: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    wordCellSection
                    
                    
                }
                .safeAreaInset(edge: .top) {
                    headerSection
                    
                }
            }
            .fullScreenBackground(.brandPaper)
            .ignoresSafeArea(.all)
            .navigationDestination(isPresented: $showWordDetailView) {
                    WordDetailView()
                }
            
            
            
        }
    }
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Wordbank")
                    .font(.largeTitle)
                    .primaryTextStyle()
                
                Text("48 words - 34 mastered")
                    .fontWeight(.light)
                    .font(.footnote)
                    .fontDesign(.rounded)
                    .kerning(0.4)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            Button {
                onAddButtonPressed()
            } label: {
                Text("Add")
                    .foregroundStyle(.brandPrimary)
                    .primaryTextStyle()
            }
        }
        .padding(.top, 60)
        .padding([.horizontal, .bottom])
        .background(.ultraThinMaterial)
    }
    
    private var wordCellSection: some View {
        ForEach($entries) { $entry in
            VStack(spacing: 15) {
                Rectangle()
                    .fill(.brandInk.opacity(0.2))
                    .frame(height: 1)
                
                Button {
                    onSelectPressed(entry: $entry)
                }label: {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(entry.term)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundStyle(.brandInk)
                            
                            Text(entry.definition)
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .foregroundStyle(.brandInk.opacity(0.7))
                                .multilineTextAlignment(.leading)
                                
                            
                        }
                        .primaryTextStyle()
                        
                        
                        Spacer()
                        
                        Image(systemName: entry.isSelected ? "circle.fill" : "circle")
                            .font(.subheadline)
                            .foregroundStyle(.brandPrimary)
                    }
                }
            }
            .padding()
        }
       
    }
    private func onAddButtonPressed() {
        Haptics.buttonTap()
    }
    
    private func onSelectPressed(entry: Binding<VocabularyEntry>) {
        Haptics.buttonTap()
//        entry.wrappedValue.isSelected.toggle()
        showWordDetailView = true
    }
}

#Preview {
    WordView()
}
