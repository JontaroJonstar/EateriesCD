//
//  ContentView.swift
//  Milestone1
//
//  Created by Johnson Taylor on 20/3/21.
//
import Foundation
import SwiftUI



struct DetailsView: View {
    
    
    //Property wrapper to allow for per screen size alterations
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.editMode) var editMode
    @ObservedObject var entry: Entry
    @Environment(\.managedObjectContext) private var viewContext
    
//    @State private var draftEntry = Entry.default
    
//    @ObservedObject var entry: EntryC
//    @Binding var entry: Entry
    
    
    
    var body: some View {

            ZStack {    //Background elements
                        Color.gray
                Image(uiImage: "\(entry.image ?? "")".load())
                    // BGround Image parameters
                    .resizable()
                    
                    .padding()
                    .opacity(0.3)
                            
                       
            
                        
//                    if sizeClass == .regular {
//                        // if statement covering regular size screen formating
//
//                        VStack{  //Vertical Ordering and elements
//
//                            //Food Image
//                            Image(uiImage: "\(entry.image ?? "")".load())
//                                // Image Parameters
//                                .resizable()
//                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                                .frame(width: 400, height: 300, alignment: .topLeading)
//                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                .scaledToFit()
//                                .padding()
//
//                            ScrollView {
//                                // Rest Title
//                                Text("\(entry.title ?? "")")
//                                    // Title Parameters
//                                    .font(.custom("Geneva", size: 35))
//                                    .multilineTextAlignment(.leading)
//                                    .padding(.horizontal, 50)
//                                    .frame(width: 700)
//                                    .background(Color.red)
//                                    .foregroundColor(.white)
//
//                                    .lineSpacing(0.5)
//
//                                //Rest Location
//                                Text("\(entry.location ?? "")").italic()
//                                    // Location Parameters
//                                    .padding(.horizontal, 5)
//                                    .frame(width: 700)
//                                    .background(Color.red)
//                                    .foregroundColor(.white)
//                                    .font(.headline)
//                                    .lineSpacing(0.5)
//
//                                //Rest Notes
//                                Text("\(entry.notes ?? "")")
//                                    // Notes Paramters
//                                    .multilineTextAlignment(.leading)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 10)
//                                    .frame(width: 700)
//                                    .background(Color.red)
//                                    .foregroundColor(.white)
//                                    .font(.body)
//                                    .lineSpacing(0.5)
//
//
////                                Button("ADD REVIEW +", action: {entry.review.append(("New Review")); entry.author.append(("New Author"))})
////                                    // Button that adds a new author and review to the entry
////                                Text("REVIEW")
////                                    .multilineTextAlignment(.leading)
////                                    .padding(.horizontal, 10)
////                                    .padding(.vertical, 10)
////                                    .frame(width: 700)
////                                    .background(Color.red)
////                                    .foregroundColor(.white)
////                                    .font(.title)
////                                    .lineSpacing(0.5)
//
//                            }
//                        }
//
//
//                        // else encompasses all screen sizes other than regular ie: compact
//                    }else{
                        
                        VStack{ //Vertical Ordering and elements

                            
                            ScrollView {
                                //Rest Image
                                Image(uiImage: "\(entry.image ?? "")".load())
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 250.0, height: 200)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .scaledToFit()
                                //Rest Title
                                Text("\(entry.title ?? "")")
                                    .font(.custom("Geneva", size: 30))
                                    
                                    .padding(.horizontal, 20)
                                    .frame(width: 310, alignment: .topLeading)
                                    .background(Color.red)
                                    .foregroundColor(.white)

                                    .lineSpacing(0.5)
                                
                                //Rest Location
                                Text("\(entry.location ?? "")").italic()
                                    .padding(.horizontal, 5)
                                    .frame(width: 310)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .lineSpacing(0.5)
                                
                                //Rest Notes
                                Text("\(entry.notes ?? "")")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .frame(width: 310)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .font(.body)
                                    .lineSpacing(0.5)
                                
//                                Button("ADD REVIEW +", action: {entry.review.append(("New Review")); entry.author.append(("New Author"))})
                                
                            }
                            List{
                                
                                    Button("Add Review +", action: addReview)
                                    // Button that adds a new author and review to the entry
                                    Text("REVIEW")
                                        .multilineTextAlignment(.leading)
//                                        .padding(.horizontal, 10)
//                                        .padding(.vertical, 10)
                                        .frame(width: 290)
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .lineSpacing(0.5)
                                
                                    ForEach(entry.reviewArray) { rev in
                                        ReviewView(review: rev)
                                    }
                                    
                                    .onDelete(perform: entry.deleteReviews)
                                }
                                                                                        
//                                { offsets in
//                                    withAnimation{ entry.deleteReviews(offsets: offsets) }
//                                }
//                                
//                                ForEach(entry.review.indices, id: \.self) { i in
//                                    Text(entry.author[i] + ": " + entry.review[i])
//                                        .multilineTextAlignment(.leading)
//                                        .padding(.horizontal, 10)
//                                        .padding(.vertical, 10)
//                                        .frame(width: 310)
//                                        .background(Color.red)
//                                        .foregroundColor(.white)
//                                        .font(.body)
//                                        .lineSpacing(0.5)
                                        
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(leading: EditButton(), trailing:
                                                NavigationLink(destination: EditTextView(entry: entry)) {
                                            Text("Edit Entry")})
                            
                                
                            }
                            
                            
//                            // Edit button which moves to the EditTextView View
//
                        }
                
                    
        
            
    
    
    private func addReview() {
        //function that appends an entry to the entryArray
        withAnimation {
            let review = Review(context: viewContext)
            review.author = "New Author"
            review.review = "Review #\(entry.reviewArray.count + 1)"
            var reviews = entry.reviewArray
            reviews.append(review)
            entry.reviews = NSOrderedSet (array: reviews)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
//    func deleteReviews(at offsets: IndexSet) {
//        entry.reviewArray.remove(atOffsets: offsets)
//        }
//    func deleteReviews(offsets: IndexSet) {
//        //function that deletes the selected entry from the entryArray
//        withAnimation {
//
//            offsets.map { entry.reviewArray[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//
//    }
    
    
    
    





}
