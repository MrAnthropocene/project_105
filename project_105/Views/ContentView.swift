import SwiftUI

struct ContentView: View {
	// Variables
	@State var books = getBooks()
	@State var book: Book = Book(title: "", author: "", details: "", cover: "", review: "", rating: 1)

	// States
	@State private var showBookSheet: Bool = false
	
    var body: some View {
		NavigationStack {

			List($books, id: \.self.id) {$book in

				NavigationLink(destination: BookDetailView(book: $book)) {

                    BookListItem(book: $book)
                }.navigationTitle("Books")
			}
            
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button(action: { showBookSheet.toggle() }) {
						Image(systemName: "plus")
					}
				}
			}
			
			.sheet(isPresented: $showBookSheet) {
				if (!book.title.isEmpty) {
					books.append(book)
				}
				book = Book(title: "", author: "", details: "", cover: "", review: "", rating: 1)
			}
			content: {
				AddEditView(book: $book)
			}
		}
    }
}

#Preview {
    ContentView()
}
