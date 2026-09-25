//
//  WordView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI
struct WordView: View {
    @State private var entries = VocabularyEntry.mockEntries
    @State private var showWordDetailView: Bool = false
    @State private var showAddWordView: Bool = false
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
            .sheet(isPresented: $showAddWordView) {
                AddWordView()
            }
            .ignoresSafeArea(.all)
            
            
            
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
        .background(.ultraThickMaterial)
    }
    
    private var wordCellSection: some View {
        ForEach($entries) { $entry in
            NavigationLink {
                WordDetailView(entry: $entry)
            } label: {
                VStack(spacing: 15) {
                    Rectangle()
                        .fill(.brandInk.opacity(0.2))
                        .frame(height: 1)
                    
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
                        
                        Image(systemName: entry.isMastered ? "circle.fill" : "circle")
                            .font(.subheadline)
                            .foregroundStyle(.brandPrimary)
                    }
                }
                .padding()
            }

        }
       
    }
    private func onAddButtonPressed() {
        Haptics.buttonTap()
        showAddWordView = true
    }
    
}

#Preview {
    WordView()
}
