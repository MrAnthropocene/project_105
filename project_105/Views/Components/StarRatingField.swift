//
//  StarRaitingField.swift
//  BookManager
//
//  Created by Saul Herrera on 1/14/26.
//

import SwiftUI

struct StarRatingField: View {
    @Binding var rating: Int // 1-5

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { star in
                Button(action: {
                    self.rating = star
                }) {
                    Image(systemName: star <= self.rating ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }.buttonStyle(.plain)
                    .border(.white)
                
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Star rating: \(self.rating)/5")
    }
}


