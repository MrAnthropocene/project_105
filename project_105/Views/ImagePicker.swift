import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @Binding var image: UIImage?
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let image, let swiftUIImage = Image(uiImage: image) as Image? {
                swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.secondary.opacity(0.1))
                        .frame(height: 200)
                    VStack(spacing: 6) {
                        Image(systemName: "photo")
                            .font(.system(size: 36))
                            .foregroundStyle(.secondary)
                        Text("No cover selected")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                Label(image == nil ? "Select Cover" : "Change Cover", systemImage: "photo.on.rectangle")
            }
            .onChange(of: selectedItem) { _, newValue in
                guard let newValue else { return }
                Task {
                    if let data = try? await newValue.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        await MainActor.run { self.image = uiImage }
                    } else if let img = try? await newValue.loadTransferable(type: UIImage.self) {
                        await MainActor.run { self.image = img }
                    }
                }
            }
        }
    }
}
