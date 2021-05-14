//
//  ReviewView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 14/5/21.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var review: Review
    var body: some View {
        VStack{
            Text("~~")
        TextEditor(text: $review.author ?? "default value")
            .border(Color.black, width: 1)
        TextEditor(text: $review.review ?? "default value")
            .border(Color.black, width: 1)

        }

    }
    
}
