//
//  ReviewView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI

struct ReviewView: View {
    @State private var entries = VocabularyEntry.mockEntries
    @State private var currentIndex = 0
    @State private var hasEndedSession = false
    private var currentEntry: VocabularyEntry? {
        guard !hasEndedSession, entries.indices.contains(currentIndex) else {
            return nil
        }
        return entries[currentIndex]
    }
    @State private var isFlipped: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(currentIndex)/\(entries.count)")
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)

                    Spacer()

                    Button("End", action: onEndPressed)
                        .fontDesign(.rounded)
                        .foregroundStyle(.secondary)
                        .disabled(currentEntry == nil)
                }
                ThinLinearProgressBar(
                        value: Double(currentIndex),
                        total: Double(max(entries.count, 1))
                    )

                Spacer()
                if let entry = currentEntry {
                    ZStack {
                        if isFlipped {
                            VStack(alignment: .leading, spacing: 30) {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text(entry.term)
                                        .font(.largeTitle)
                                        .primaryTextStyle()


                                    Text(entry.definition)
                                        .fontDesign(.serif)
                                        .fontWeight(.regular)
                                        .font(.headline)

                                    Divider()

                                    Text(entry.note)
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
                                Text(entry.term)
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
                } else {
                    VStack(spacing: 16) {
                        if entries.isEmpty {
                            Text("No words to review")
                        } else {
                            Text(hasEndedSession ? "Review ended" : "Review complete")
                            Button("Review again", action: onRestartPressed)
                        }
                    }
                }



            }
            .padding(.horizontal)

            .toolbarVisibility(currentEntry == nil ? .visible : .hidden, for: .tabBar)
        }
    }
    private func onFlippedPressed() {
        guard currentEntry != nil, !isFlipped else { return }
        Haptics.buttonTap()
        withAnimation(.easeInOut(duration: 0.25)) {
            isFlipped = true
        }
    }
    private func onDidNotPressed() {
        answerCurrentWord(remembered: false)
    }
    private func onGotItPressed() {
        answerCurrentWord(remembered: true)
    }

    private func onEndPressed() {
        guard currentEntry != nil else { return }
        Haptics.buttonTap()
        hasEndedSession = true
        isFlipped = false
    }
    private func answerCurrentWord(remembered: Bool) {
        guard currentEntry != nil, isFlipped else { return }
        Haptics.buttonTap()

        entries[currentIndex].reviewCount += 1
        entries[currentIndex].lastSeenDate = .now
        entries[currentIndex].lastReviewRemembered = remembered

        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            currentIndex += 1
            isFlipped = false
        }
    }

    private func onRestartPressed() {
        Haptics.buttonTap()
        currentIndex = 0
        isFlipped = false
        hasEndedSession = false
    }
}

#Preview {
    ReviewView()
}
