//
//  CircularStepper.swift
//  Wordbank
//
//  Created by Mahipal Singh on 09/10/26.
//


import SwiftUI

// MARK: - Reusable Circular Stepper Component
struct CircularStepper: View {
    @Binding var value: Int
    var range: ClosedRange<Int> = 1...50
    var step: Int = 1
    
    var body: some View {
        HStack(spacing: 12) {
            // Minus Button
            Button(action: decrement) {
                Image(systemName: "minus")
                    .imageScale(.large)
                    .padding(6)
            }
            .disabled(!canDecrement)
            .buttonBorderShape(.circle)
            .buttonStyle(.glass)
            
            // Value Label
            Text("\(value)")
                .fontDesign(.monospaced)
                .foregroundStyle(.brandInk)
                .contentTransition(.numericText(value: Double(value)))
            
            Button(action: increment) {
                Image(systemName: "plus")
                    .imageScale(.medium)
                    .padding(2)
            }
            .disabled(!canIncrement)
            .buttonBorderShape(.circle)
            .buttonStyle(.glass)
        }
        .buttonStyle(.plain)
    }
    
    private var canDecrement: Bool {
        value - step >= range.lowerBound
    }
    
    private var canIncrement: Bool {
        value + step <= range.upperBound
    }
    
    private func decrement() {
        if canDecrement {
            Haptics.buttonTap()
            value -= step
        }
    }
    
    private func increment() {
        if canIncrement {
            Haptics.buttonTap()
            value += step
        }
    }
}

struct WordsPerSessionRow: View {
    @Binding var wordsPerSession: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                // Left Labels
                VStack(alignment: .leading, spacing: 4) {
                    Text("Words per session")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(.primary)
                    
                    Text("Keep it short enough to finish")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(.secondaryLabel))
                }
                
                Spacer()
                
                // Stepper
                CircularStepper(
                    value: $wordsPerSession,
                    range: 1...30
                )
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            
            // Bottom Hairline Divider
            Divider()
                .padding(.leading, 16)
        }
    }
}

// MARK: - Preview
#Preview {
    struct PreviewWrapper: View {
        @State private var wordsCount = 12
        
        var body: some View {
            VStack {
                WordsPerSessionRow(wordsPerSession: $wordsCount)
                Spacer()
            }
            .background(Color(.systemBackground))
        }
    }
    
    return PreviewWrapper()
}
