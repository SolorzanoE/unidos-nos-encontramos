//
//  FieldComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 02/04/25.
//


import SwiftUI
import PhotosUI

struct FieldICCComponent: View {
    let type: FieldICCType
    @Binding var text: String
    var name: String?
    let placeholder: String
    var isRequired: Bool = false
    var fontSize: FontStyle = .body

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let name = name {
                HStack(spacing: 2) {
                    TextComponent(text: name, style: .body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.grey500)
                    
                    if isRequired {
                        TextComponent(text: "*", style: .body)
                            .foregroundStyle(.red400)
                            .fontWeight(.semibold)
                    }
                }
            }

            fieldView() // Aquí se coloca el botón de imagen en el centro si aplica
        }
        .frame(maxWidth: .infinity, alignment: .leading) // Texto alineado a la izquierda
    }
    
    @ViewBuilder
    private func fieldView() -> some View {
        switch type {
        case .imageForm:
            ImagePickerView()
                .frame(maxWidth: .infinity) 
        case .boxContainer:
            TextField(placeholder, text: $text)
                .font(.custom("Montserrat", size: fontSize.size))
                .foregroundStyle(.grey500)
                .padding(10)
                .background(.grey50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(color: .black.opacity(0.25), radius: 3, y: 3)
        case .check:
            Toggle(isOn: .constant(false)) {
                Text(placeholder)
            }
            .padding()
        }
    }
}

enum FieldICCType {
    case boxContainer
    case imageForm
    case check
}

struct ImagePickerView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImageData: Data?

    var body: some View {
        HStack {
            Spacer() // Esto empuja el botón al centro
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                if let imageData = selectedImageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .padding(40)
                        .frame(width: 150, height: 150)
                        .foregroundStyle(.grey500)
                        .background(Color.grey50)
                        .clipShape(Circle())
                        .shadow(radius: 4, y: 4)
                }
            }
            .onChange(of: selectedItem) { oldItem, newItem in
                guard let newItem else { return }
                Task {
                    if let data = try? await newItem.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            Spacer() // Esto asegura que el botón quede centrado
        }
    }
}

#Preview {
    FieldICCComponent(type: .imageForm, text: .constant(""), name: "Selecciona una imagen", placeholder: "", isRequired: false, fontSize: .body)
}

