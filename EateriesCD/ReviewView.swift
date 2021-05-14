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
//        TextEditor(text: $review.author ?? "default value")
//            .border(Color.black, width: 1)
//            .frame (width:200)
//            .padding(.horizontal, 100)
        



        
//        Text("\(review.author ?? "")" + "\(review.review ?? "")")
        
//        TextField("Author", text: $review.author ?? "default value")
//            .border(Color.white, width: 1)
//            .lineSpacing(1.0)
//
//        TextField("Review", text: $review.review ?? "default value")
//            .border(Color.black, width: 1)
            Text("~~")
//
        TextEditor(text: $review.author ?? "default value")
            .border(Color.black, width: 1)
        TextEditor(text: $review.review ?? "default value")
            .border(Color.black, width: 1)

        }
//
                                    



//        Text("\(review.author ?? "")" + ":" + "\(review.review ?? "")")
//        .multilineTextAlignment(.leading)
//        .padding(.horizontal, 10)
//        .padding(.vertical, 10)
//        .frame(width: 310)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .font(.body)
//        .lineSpacing(0.5)
    }
    
}
