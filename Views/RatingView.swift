//
//  RatingView.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - Properties
    
    @Binding var rating:Int
    
    var maximumRating = 6
    var starImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    // MARK: - main body
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating, id:\.self) { indexNumber in
                starImage
                    .foregroundStyle(indexNumber > rating  ? offColor : onColor)
                    .onTapGesture {
                        rating = indexNumber
                    }
            }
        }
    }
}

// MARK: - Preview
#Preview("RatingView") {
    RatingView(rating:.constant(0))
}
