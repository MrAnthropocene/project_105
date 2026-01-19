import SwiftUI

struct AddEditView: View {
	
	// States
	@Binding var book: Book
	@State var workingBook: Book
	@Environment(\.dismiss) private var dismiss

	init(book: Binding<Book>) {
		_book = book
		_workingBook = .init(initialValue: book.wrappedValue)
	}
	
	var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("Book Details")) {
					TextField("Title", text: $workingBook.title)
					
					TextField("Author", text: $workingBook.author)
					
					Picker("Genre", selection: $workingBook.genre){
						ForEach(Genre.allCases, id: \.self) { genre in
							Text(genre.rawValue).tag(genre)
						}
					}
					
					TextEditor(text: $workingBook.details)
						.frame(height: 150)
					
				}
				
				Section(header: Text("Book Review")) {
//					Picker("Raiting", selection: $workingBook.raiting) {
//						Text("select a raiting").tag(0)
//						ForEach(1...5, id: \.self) {
//							Text("\($0) stars").tag($0)
//						}
//					}
                    StarRatingField(rating: $workingBook.rating)
					TextEditor(text: $workingBook.review)
						.frame(height: 150)
					
				}
			}
			
			// Tittle
			.navigationTitle("Add/Edit Book")
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button{
						book.title = workingBook.title
						book.author = workingBook.author
						book.details = workingBook.details
						book.review = workingBook.review
						book.rating = workingBook.rating
						dismiss()
					} label: {
						Image(systemName: "checkmark")
					}.disabled(workingBook.title.isEmpty)
				}
				
				ToolbarItem(placement: .cancellationAction) {
					Button { dismiss() } label: {
						Image(systemName: "xmark")
					}
				}
			}
		}
		
	}
}

