//
//  DetailView.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    
    let book:Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State var isShowAlert = false
    
    // MARK: - body
    
    var body: some View {
        
        ScrollView {
            ZStack(alignment:.bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .padding()
                    
                
                Text(book.genre ?? "")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(20)
                    .foregroundStyle(Color.cyan)
                    .offset(y:-10)
                    
            }
            
            VStack{
                Text(book.author ??  "")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                RatingView(rating:.constant(Int(book.rating)))
            }
            .navigationTitle(book.title ?? "")
        }
        
        // MARK: - Show Alert View
        
        .alert("Delete", isPresented:$isShowAlert) {
            Button("Delete", role:.destructive, action:deleteExistingItem)
        } message: {
            Text("Are u sure want to delete this item?")
        }
        
        // MARK: - Add toolbar to show delete button
        .toolbar {
            ToolbarItem(placement:.topBarTrailing) {
                Button {
                    isShowAlert = true
                } label: {
                    Label("Delete", systemImage:"trash")
                }
                
            }
        }
        
    }
    
    
    // MARK: - Create deleteExistingItem to delete item
    
    func deleteExistingItem() {
        moc.delete(book)
        try? moc.save()
        dismiss()
    }
}


