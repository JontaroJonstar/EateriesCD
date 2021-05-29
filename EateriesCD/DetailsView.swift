//
//  ContentView.swift
//  Milestone1
//
//  Created by Johnson Taylor on 20/3/21.
//
import Foundation
import SwiftUI

// View for individual resturant entries
struct DetailsView: View {

    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.editMode) var editMode
    @ObservedObject var entry: Entry
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {

        //Background elements
            ZStack {
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
                
                //Vertical Ordering and elements
                        VStack{

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
                                
                                
                                // Rest Location > link to MapScreen
                                NavigationLink(destination: MapScreen(entry: entry))  {
                                    Text("Location: " + "\(entry.name ?? "")")
                                }
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                                    .frame(width: 310)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .font(.body)
                                    .lineSpacing(0.5)
                                    .overlay(Image(systemName: "chevron.right"), alignment: .trailing)

                                
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

                            }
                            HStack{

                                Text("REVIEW")
                                    .padding()
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.title2)

                                // Button that adds a new author and review to the entry
                                Button("Add Review +", action: addReview)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .scaleEffect(CGSize(width: 0.6, height: 0.6))

                                // Button that enables edit mode and allows for deletion/movement of reviews
                                EditButton()
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .scaleEffect(CGSize(width: 0.6, height: 0.6))
                            }
                            .frame(maxHeight: 30.0)
                           
                            // List containing the reviews
                            List{

                                    ForEach(entry.reviewArray) { rev in
                                        ReviewView(review: rev)
                                    }
                                    // func that allows movement of list items during editMode
                                    .onMove {
                                        //onMove function, which allows moving of entries in EditMode
                                        entry.reviewArray.move(fromOffsets: $0, toOffset: $1)
                                }
                                    // func that allows deletion of list items during editMode
                                    .onDelete(perform: entry.deleteReviews)

                                        
                        }
                        .navigationBarTitleDisplayMode(.inline)
                            // Link to EditTextView
                            .navigationBarItems(trailing:
                                                NavigationLink(destination: EditTextView(entry: entry)) {
                                            Text("Edit Entry")})

                            }
                        }
    }
   
    
    //function that appends an entry to the entryArray
    private func addReview() {
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
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
