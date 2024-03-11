//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by Dip Dutt on 30/12/23.
//

import SwiftUI

struct EmojiRatingView: View {
    
    // MARK: - Property
    
    let rating:Int16
    // MARK: - body
    
    var body: some View {
        VStack {
            switch rating {
            case 1:
                Text("😩")
            case 2:
                Text("😔")
            case 3:
                Text("🙂")
            case 4:
                Text("☺️")
            default:
                Text("😎")
            }
        }
    }
}

#Preview("EmojiRatingView") {
    EmojiRatingView(rating:0)
}
