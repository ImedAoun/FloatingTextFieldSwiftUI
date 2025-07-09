//
//  FloatingTextField.swift
//  FloatingTextFieldSwiftUI
//
//  Created by BENAOUN Imed on 09/07/2025.
//

import SwiftUI

struct FloatingLabelContainer<Label: View, Field: View>: View {
    // MARK: Lifecycle

    init(text: String,
         @ViewBuilder label: () -> Label,
         @ViewBuilder field: () -> Field) {
        self.text = text
        self.label = label()
        self.field = field()
    }

    // MARK: Internal

    let text: String

    let label: Label
    let field: Field

    var body: some View {
        ZStack(alignment: .leading) {
            label
                .readSize { labelSize = $0 }
                .offset(y: translateLabel ? 0 : labelOffset)
                .scaleEffect(scaleEffect, anchor: .leading)
                .animation(.easeInOut(duration: animationDuration), value: translateLabel)

            field
                .readSize { fieldSize = $0 }
                .focused($isFocused)
                .background(.clear)
                .padding(.top, 8)
        }
        .frame(minHeight: totalHeight)
        .animation(.easeInOut(duration: animationDuration), value: isFocused)
    }

    // MARK: Constant

    private let animationDuration: Double = 0.2
    private let labelOffset: CGFloat = -20

    // MARK: Private

    @FocusState private var isFocused: Bool
    @State private var labelSize: CGSize = .zero
    @State private var fieldSize: CGSize = .zero

    private var translateLabel: Bool {
        text.isEmpty && !isFocused
    }

    private var scaleEffect: Double {
        translateLabel ? 1 : 0.75
    }

    private var totalHeight: CGFloat {
        return fieldSize.height + abs(labelOffset) + labelSize.height
    }
}

@available(iOS 17.0, *)
#Preview("", traits: .sizeThatFitsLayout) {
    @Previewable @State var text = ""
    let textField = TextField("", text: $text)
    FloatingLabelContainer(text: text) {
        Text("Place Holder")
    } field: {
        textField
    }
    .background(.red)
    .padding(20)
}
