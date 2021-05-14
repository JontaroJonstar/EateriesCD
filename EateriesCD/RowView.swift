//
//  RowView.swift
//  EateriesCD
//
//  Created by Johnson Taylor on 14/5/21.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var entry: Entry
    var body: some View {
        HStack{
            Image(uiImage: "\(entry.image ?? "")".load())
                // Image paramters
                .resizable()
                .frame (width:75, height:50)
                .scaledToFit()
            VStack(alignment: .leading){


                Text("\(entry.title ?? "")")
                    // Title parameters
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .font(.system(size: 20))


                Text("\(entry.location ?? "")")
                    // Location paramters
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .font(.footnote)
                    .lineSpacing(0.5)

            }
        }
        
    }
}
