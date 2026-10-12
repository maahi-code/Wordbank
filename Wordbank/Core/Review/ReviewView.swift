//
//  ReviewView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var value: Double = 0.1
    @State private var total: Double = 1.0
    @State private var isFlipped: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(Int(value))/\(Int(total))")
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Text("End")
                        .fontDesign(.rounded)
                        .foregroundStyle(.secondary)
                }
                ThinLinearProgressBar(value: value, total: total)
                
                Spacer()
                
                ZStack {
                    if isFlipped {
                        VStack(alignment: .leading, spacing: 30) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("wary")
                                    .font(.largeTitle)
                                    .primaryTextStyle()
                                
                                
                                Text("careful because you don't quite trust something")
                                    .fontDesign(.serif)
                                    .fontWeight(.regular)
                                    .font(.headline)
                                
                                Divider()
                                
                                Text("The landlord was wary of students. Not the same as scared - more like watching closely.")
                                    .foregroundStyle(.secondary)
                                    .fontDesign(.serif)
                                    .fontWeight(.regular)
                                    .font(.headline)
                            }
                            .foregroundStyle(.brandInk)
                            .padding(.top, 50)
                            
                            Spacer()
                            
                            HStack {
                                Button {
                                    onDidNotPressed()
                                }label: {
                                    Text("Didn't get it")
                                        .font(.headline)
                                        .fontDesign(.rounded)
                                        .kerning(0.5)
                                        .foregroundStyle(.brandPrimary)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                }
                                
                                .buttonStyle(.glass)
                                
                                Button {
                                    onGotItPressed()
                                }label: {
                                    Text("Got it")
                                        .font(.headline)
                                        .fontDesign(.rounded)
                                        .kerning(0.5)
                                        .foregroundStyle(.brandPaper)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                }
                                
                                .buttonStyle(.glassProminent)
                            }
                            .padding(.bottom)
                            
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.96)))
                    } else {
                        VStack {
                            Spacer()
                            Text("wary")
                                .font(.system(size: 60))
                                .primaryTextStyle()
                                .foregroundStyle(.brandInk)
                            
                            
                            Spacer()
                            
                            Text("Tap anywhere to reveal")
                                .fontDesign(.serif)
                                .foregroundStyle(.secondary)
                                .font(.subheadline)
                            
                            
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            onFlippedPressed()
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.96)))
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isFlipped)
                
                
            }
            .padding(.horizontal)
            
            .toolbarVisibility(.hidden, for: .tabBar)
        }
    }
    private func onFlippedPressed() {
        Haptics.buttonTap()
        withAnimation(.easeInOut(duration: 0.25)) {
                    isFlipped = true
                }
    }
    private func onDidNotPressed() {
        Haptics.buttonTap()
        advanceToNextWord()
    }
    private func onGotItPressed() {
        Haptics.buttonTap()
        advanceToNextWord()
    }
    
    private func onEndPressed() {
        dismiss()
        
    }
    private func advanceToNextWord() {
            if value < total {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    value += 1.0
                    isFlipped = false
                }
            } else {
                onEndPressed()
            }
        }
}

#Preview {
    ReviewView()
}
