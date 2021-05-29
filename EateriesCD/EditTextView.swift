//
//  EditTextView.swift
//  Milestone1
//
//  Created by Johnson Taylor on 6/4/21.
//

import Foundation
import SwiftUI

//Function that acts as an operator overload
//It creates a Binding that returns the left side of the operator's value if it's not nil, otherwise it returns the default value from the right side.
func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
    

//struct that controls the layout/formatting of EditTextView
struct EditTextView: View {
    @Environment(\.managedObjectContext) private var ViewContext
    @ObservedObject var entry: Entry
    var body: some View{
            VStack{
                Form {
                    Section{
                        
                        VStack{Text("Title")
                            .font(.footnote)
                        TextField("Title", text: $entry.title ?? "default value", onCommit: {
                            UIApplication.shared.endEditing()
                        })}

                        VStack{Text("Notes")
                            .font(.footnote)
                        TextField("Notes", text: $entry.notes ?? "default value", onCommit: {
                            UIApplication.shared.endEditing()
                        })}
                        
                        VStack{Text("ImageURL")
                            .font(.footnote)
                        TextField("Image URL", text: $entry.image ?? "default value", onCommit: {
                            UIApplication.shared.endEditing()
                        })}

                    }
                }

                
      }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Entry")
      }
}


