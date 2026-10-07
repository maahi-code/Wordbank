import SwiftUI


enum NewWordField {
    case word, definition, note
}
struct UnderlinedTextField<FocusType: Hashable> : View {
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var focusValue: FocusType
    @FocusState.Binding var focusedField: FocusType?
    
    var accentColor: Color = .accent
    var inactiveColor: Color = Color(.systemGray5)
    
    var isMultiline: Bool = false
    
    private var isFocused: Bool {
        focusedField == focusValue
    }
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(label.uppercased())
                    .font(.system(size: 11, weight: .semibold))
                    .tracking(1.2)
                    .foregroundStyle(Color(.secondaryLabel))
                
                Group {
                    if isMultiline {
                        TextField(
                            "",
                            text: $text,
                            prompt: Text(placeholder)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(Color(.placeholderText)),
                            axis: .vertical
                        )
                        .lineLimit(1...4)
                    } else {
                        TextField(
                            "",
                            text: $text,
                            prompt: Text(placeholder)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(Color(.placeholderText))
                        )
                    }
                }
                .textFieldStyle(.plain)
                .font(.system(size: 22, weight: .regular, design: .serif))
                .tint(accentColor)
                .focused($focusedField, equals: focusValue)
                .padding(.bottom, 6)
                
                Rectangle()
                    .fill(isFocused ? accentColor : inactiveColor)
                    .frame(height: isFocused ? 1.5 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isFocused)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                focusedField = focusValue
            }
        }
}

#Preview {
    struct UnderlinedTextFieldPreviewContainer: View {
        enum Field: Hashable {
            case word
            case definition
        }
        
        @State private var word: String = "brittle"
        @State private var definition: String = ""
        @FocusState private var focusedField: Field?
        
        var body: some View {
            VStack(spacing: 32) {
                // Focused state example
                UnderlinedTextField(
                    label: "WORD",
                    placeholder: "Enter word",
                    text: $word,
                    focusValue: .word,
                    focusedField: $focusedField
                )
                
                // Unfocused / Multiline placeholder example
                UnderlinedTextField(
                    label: "DEFINITION — IN YOUR OWN WORDS",
                    placeholder: "What does it mean to you?",
                    text: $definition,
                    focusValue: .definition,
                    focusedField: $focusedField,
                    isMultiline: true
                )
            }
            .padding(24)
            .onAppear {
                focusedField = .word
            }
        }
    }
    
    return UnderlinedTextFieldPreviewContainer()
}
