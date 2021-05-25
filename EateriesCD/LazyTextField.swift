//
//  LazyTextField.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 26/5/21.
//

import SwiftUI

struct LazyTextField: View {
    var prompt: String
    @State var string: String
    let originalBinding: Binding<String>
    var commit: () -> Void
    
    init(_ prompt: String, text: Binding<String>, onCommit: @escaping () -> Void = {}) {
        self.prompt = prompt
        originalBinding = text
        string = text.wrappedValue
        commit = onCommit
    }
    
    func updateBinding() {
        originalBinding.wrappedValue = string
    }
    
    var body: some View {
        TextField(prompt, text: $string, onEditingChanged : {
            if $0 == false { updateBinding() }
        }, onCommit: commit)
        .onDisappear(perform: updateBinding)
    }
    
}
