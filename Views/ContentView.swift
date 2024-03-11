//
//  ContentView.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors:[
        SortDescriptor(\.title)
    ]) var books:FetchedResults<Book>
    @State var isShowSheeet:Bool = false
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ZStack {
                if books.isEmpty {
                    Text("No Item Found on the List📋")
                        .font(.system(size:20))
                }
                else {
                    List {
                        ForEach(books) { book in
                            NavigationLink {
                                DetailView(book:book)
                            } label: {
                                HStack(spacing: 10) {
                                    EmojiRatingView(rating:book.rating)
                                    VStack(alignment:.leading, spacing: 5){
                                        Text(book.title ?? "")
                                            .font(.headline)
                                        Text(book.author ?? "")
                                            .font(.caption)
                                    }
                                }
                            }
                            
                        }
                        .onDelete(perform: deleteItem)
                    }
                }
                
                
                
            }
            
            .navigationTitle("BookWorm📖")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowSheeet = true
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
            }
            
        }
        
        // MARK: - Present Sheet
        
        .sheet(isPresented: $isShowSheeet, content: {
            BookView()
            
        })
    }
    
    // MARK: - Cretae Fuction to Delete Items
    
    func deleteItem(at indexs:IndexSet) {
        for index in indexs {
            let book = books[index]
            moc.delete(book)
        }
        try? moc.save()
    }
}

// MARK: - Preview

#Preview("ContentView") {
    ContentView()
}
