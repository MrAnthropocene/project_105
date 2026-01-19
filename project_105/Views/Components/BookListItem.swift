import SwiftUI

struct BookListItem: View {
    @Binding var book: Book

    var body: some View {
        HStack {
            Image(book.cover)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 60, maxHeight: 60)

            VStack(alignment: .leading) {
                Text(book.title)

                StarRatingField(rating: $book.rating)
                    .font(.footnote)
            }
        }
    }
}
