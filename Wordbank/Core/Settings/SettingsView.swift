//
//  SettingsView.swift
//  Wordbank
//
//  Created by Mahipal Singh on 10/09/26.
//

import SwiftUI

struct SettingsView: View {
    @State private var value: Int = 0
    @State private var enableDailyReminder: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .primaryTextStyle()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Review")
                        .textCase(.uppercase)
                        .font(.caption)
                        .kerning(0.5)
                        .foregroundStyle(.brandInk.opacity(0.5))
                        .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Word per session")
                                .font(.title3)
                                .fontWeight(.light)
                                .foregroundStyle(.brandInk)
                                .fontDesign(.rounded)
                                .kerning(0.5)
                            
                            Text("Keep it short enought to finish")
                                .fontWeight(.light)
                                .font(.footnote)
                                .foregroundStyle(.brandInk.opacity(0.5))
                            
                            
                            
                        }
                        Spacer()
                        
                        CircularStepper(value: $value, range: 0...20)
                        
                        
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("REMINDER")
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(0.5)
                            .foregroundStyle(.brandInk.opacity(0.5))
                            .padding(.horizontal)
                        
                        Divider()
                        
                        
                        Toggle("Daily reminder", isOn: $enableDailyReminder)
                            .padding()
                        
                        Divider()
                        
                        
                        HStack {
                            Text("Time")
                                .font(.title3)
                                .fontDesign(.rounded)
                                .kerning(0.4)
                                .fontWeight(.light)
                            Spacer()
                            
                            Text("21:00")
                                .font(.title3)
                                .fontDesign(.monospaced)
                                .kerning(0.4)
                                .fontWeight(.light)
                                .foregroundStyle(.brandPrimary)
                        }
                        .padding()
                        
                        Divider()
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("Data")
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(0.5)
                            .foregroundStyle(.brandInk.opacity(0.5))
                            .padding(.horizontal)
                        
                        Divider()
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Reset all words")
                                .font(.title3)
                                .fontDesign(.rounded)
                                .kerning(0.4)
                                .fontWeight(.light)
                                .foregroundStyle(.red)
                            
                            Text("Delete all 8 words and your streak. Can't be undone")
                                .font(.subheadline)
                                .fontDesign(.rounded)
                                .kerning(0.4)
                                .fontWeight(.light)
                                .foregroundStyle(.brandInk.opacity(0.4))
                        }
                        .padding()
                        
                        Divider()
                    }
                    .padding(.vertical)
                    
                   
                }
                Text("Wordbank 1.0")
                    .foregroundStyle(.brandPrimary.opacity(0.4))
                    .fontDesign(.monospaced)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                Spacer()
                
               
            }
        }
    }
}

#Preview {
    SettingsView()
}
