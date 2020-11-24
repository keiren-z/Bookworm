//
//  ratingView.swift
//  Bookworm
//
//  Created by Keiren on 11/22/20.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    
    var maximunRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            /*
             #If the label has any text use it, then use ForEach
             to count from 1 to the maximun rating plus 1 and call image(for:) repeatedly.
            */
            if label.isEmpty == false {
                Text(label)
            }
            /*
             #Apply a foreground color depending on the rating, and add a tap gesture
             that ajusts the rating.
             */
            ForEach(1..<maximunRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
    
    /*
     #If the number that was passed in is greater than the current rating,
      return the off image if it was set, otherwise return the on image.
    
     #If the number that was passed in is equal to or less than the current rating,
      return the on image.
    */
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
