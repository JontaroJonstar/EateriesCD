//
//  EditTextView.swift
//  Milestone1
//
//  Created by Johnson Taylor on 6/4/21.
//

import Foundation
import SwiftUI

    
func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
    


struct EditTextView: View {
//    @Binding var entry: Entry
    @Environment(\.managedObjectContext) private var ViewContext
    @ObservedObject var entry: Entry
    
    
    

   
    
    
    
    var body: some View{
        
        
            VStack{
                Form {
                    Section{
                        VStack{Text("Title")
                            .font(.footnote)
                            TextEditor(text: $entry.title ?? "default value")
                            .border(Color.black, width: 1)}
                            
                        VStack{Text("Location")
                            .font(.footnote)
                        TextEditor(text: $entry.location ?? "default value")
                            
                            .border(Color.black, width: 1)}
                        VStack{Text("Notes")
                            .font(.footnote)
                            TextEditor(text: $entry.notes ?? "default value")
                                .border(Color.black, width: 1)}
//                        VStack{
//                            Text("Reviews")
//                            .font(.footnote)
//                            ForEach(entry.review.indices, id: \.self) { i in
//                                Text("Author")
//                                .font(.footnote)
//                                TextEditor(text: $entry.author[i])
//                                    .border(Color.black, width: 1)
//                                Text("Review")
//                                .font(.footnote)
//                                TextEditor(text: $entry.review[i])
//                                    .border(Color.black, width: 1)
//                            }
//                        }

                        VStack{Text("ImageURL")
                            .font(.footnote)
                            TextEditor(text: $entry.image ?? "default value")
                            .border(Color.black, width: 1)}
                    }
                }

                
      }
          .navigationTitle("Edit Entry")
      }
}


