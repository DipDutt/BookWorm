//
//  BookView.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import SwiftUI




struct BookView: View {
    
    
    // MARK: - Properties
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State var titleOfTheBook:String = ""
    @State var authorName:String = ""
    @State var reviewWriting:String = ""
    @State var selectGenere:String = ""
    @State var rating:Int = 0
    
    
    let genreType = ["Fantasy", "Horror", "Mystery", "Romance", "Poetry", "Action", "Thriller"]
    
    var body: some View {
        Form {
            Section("Add Details📋") {
                TextField("Name Of The Book", text:$titleOfTheBook)
                TextField("Author Name", text:$authorName)
                Picker("Genre", selection:$selectGenere) {
                    ForEach(genreType, id:\.self) {
                        Text($0)
                            .tag($0)
                    }
                    
                }
            }
            
            Section {
                TextEditor(text:$reviewWriting)
                RatingView(rating: $rating)
            } header: {
                Text("Write a Review📝")
            }
            
            Section("Add & Save ⏎") {
                Button {
                    save()
                } label: {
                    Label("Save", systemImage: "plus.circle.fill")
                }
                
            }
            
        }
        
    }
    
    
    // MARK: - Create save() Fuction
    
    func save() {
        let newBook = Book(context:moc)
        newBook.id = UUID()
        newBook.title = titleOfTheBook
        newBook.author = authorName
        newBook.review = reviewWriting
        newBook.rating = Int16(rating)
        newBook.genre = selectGenere
        try? moc.save()
        dismiss()
    }
    
}

#Preview("BookView") {
    NavigationStack{
        BookView()
    }
}
