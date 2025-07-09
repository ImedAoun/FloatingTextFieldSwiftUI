//
//  ContentView.swift
//  FloatingTextFieldSwiftUI
//
//  Created by BENAOUN Imed on 09/07/2025.
//
import SwiftUI

struct ContentView: View {

    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {

            Spacer()

            FloatingTextField(text: username) {
                Text("placeholder username")
                    .foregroundColor(.black)
                    .padding(8)
            } field: {
                TextField("", text: $username)
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

            Spacer()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .background(.black)
    }
}

@available(iOS 17.0, *)
#Preview("", traits: .sizeThatFitsLayout) {

    @Previewable @State var username = ""
    @Previewable @State var password = ""

    ContentView(username: username, password: password)

}
