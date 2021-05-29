//
//  ReviewView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 14/5/21.
//

import SwiftUI

//struct that controls the layout/formatting of the 'reviews' (used in DetailsView)
struct ReviewView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var review: Review
    
    var body: some View {
        VStack{

            TextField("Author", text: $review.author ?? "default value", onCommit: {
                UIApplication.shared.endEditing()
            })
            .border(Color.white, width: 1)
            .lineSpacing(1.0)
            
            TextEditor(text: $review.review ?? "default value"
            )
            .border(Color.white, width: 1)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .lineSpacing(1.0)
            .frame(maxHeight: nil)

        }
    }
}
