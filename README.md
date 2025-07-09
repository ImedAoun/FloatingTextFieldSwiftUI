# FloatingTextFieldSwiftUI

![Demo of FloatingTextFieldSwiftUI](FloatingTextFieldSwiftUI/Assets/demo.gif)

🚀 A clean and customizable SwiftUI floating text field component — ideal for modern iOS forms.

![FloatingTextFieldSwiftUI Demo](demo.gif) <!-- Replace or remove if no demo yet -->

---

## ✨ Features

- ✅ Built entirely with SwiftUI (no UIKit)
- 💬 Smooth floating label animation
- 🔐 Supports secure input fields (`SecureField`)
- 🎨 Easy customization for colors, fonts, and styles
- 📱 Supports iOS 15+

---

## 📦 Integration

To use `FloatingTextField` in your own SwiftUI project:

1. Copy the following files from this repository into your project:
   - `Views/FloatingTextField.swift`
   - (Optional) `Extensions/View+Extension.swift` if used
2. Use the component like any other SwiftUI view:

```swift
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
             FloatingTextField(text: email) {
                Text("placeholder email")
                    .foregroundColor(.black)
                    .padding(8)
            } field: {
                TextField("", text: $email)
                    .foregroundColor(.black)
                    .padding(8)
            }
            .background(.white)

            FloatingTextField(text: password) {
                Text("placeholder password")
                    .foregroundColor(.black)
                    .padding(8)
            } field: {
                SecureField("", text: $password)
                    .foregroundColor(.black)
                    .padding(8)
            }
            .background(.white)
        }
        .padding()
    }
}
