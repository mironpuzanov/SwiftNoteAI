import SwiftUI

struct FloatingInputView: View {
    @State private var inputText: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            TextField("Type here…", text: $inputText, onCommit: submit)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
            Button(action: submit) {
                Text("Go")
            }
        }
        .padding(12)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isFocused = true
            }
        }
    }

    private func submit() {
        // TODO: Handle input submit
        print("User submitted: \(inputText)")
        inputText = ""
        FloatingInputWindowManager.shared.hide()
    }
}

#if DEBUG
struct FloatingInputView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingInputView()
            .frame(width: 400, height: 100)
    }
}
#endif 