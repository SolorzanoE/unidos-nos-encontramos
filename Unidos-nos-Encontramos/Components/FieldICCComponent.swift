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
    var options: [String] = []  // Opciones para el Dropdown

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
        case .check:
            HStack(spacing: 16) {
                CheckboxButton(label: "Sí", value: "Sí", text: .constant(""))
                CheckboxButton(label: "No", value: "No", text: .constant(""))
            }
            .padding()
        case .comboBox:
            DropdownMenu(placeholder: placeholder, text: $text, options: options)
        }
    }
}


struct DropdownMenu: View {
    var placeholder: String
    @Binding var text: String
    var options: [String]
    
    @State private var isDropdownOpen = false
    @State private var dropdownHeight: CGFloat = 0 // Usado para manejar la altura del dropdown
    
    var body: some View {
        ZStack(alignment: .top) {
            // Contenedor de la vista
            VStack {
                Button(action: {
                    isDropdownOpen.toggle() // Alternar la visibilidad del dropdown
                }) {
                    HStack {
                        Text(text.isEmpty ? placeholder : text)
                            .foregroundColor(text.isEmpty ? .gray : .black)
                            .font(.custom("Montserrat", size: 16))
                            .padding(10)
                        Spacer()
                        Image(systemName: isDropdownOpen ? "chevron.up" : "chevron.down")
                            .foregroundColor(.black)
                    }
                    .padding(10)
                    .background(Color.grey50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(color: .black.opacity(0.25), radius: 3, y: 3)
                }
            }
            
            // Dropdown (menu que se sobrepone)
            if isDropdownOpen {
                VStack(spacing: 8) {
                    GeometryReader { geometry in
                        VStack(spacing: 8) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    text = option // Asignar el valor seleccionado al text
                                    isDropdownOpen = false // Cerrar el dropdown después de seleccionar
                                }) {
                                    Text(option)
                                        .font(.custom("Montserrat", size: 16))
                                        .padding(10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.white)
                                        .cornerRadius(5)
                                        .shadow(radius: 1)
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .padding(.top, 5)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(color: .black.opacity(0.1), radius: 3, y: 3)
                        .frame(height: CGFloat(options.count * 50)) // Ajuste dinámico de la altura
                        .background(Color.white)
                        .zIndex(1) // Para asegurarnos de que se superponga sobre otros elementos
                    }
                    .frame(maxWidth: .infinity)
                }
                .transition(.move(edge: .top)) // Animación para la transición del dropdown
            }
        }
        .padding(.top, 8)
        .zIndex(1) // Garantiza que el ZStack se superponga sobre otros elementos
    }
}

struct CheckboxButton: View {
    var label: String
    var value: String
    @Binding var text: String

    var body: some View {
        Button(action: {
            if text == value {
                text = ""  // Deseleccionar el valor
            } else {
                text = value // Seleccionar el valor
            }
        }) {
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 24, height: 24)
                        .cornerRadius(5)
                        .foregroundColor(text == value ? .blue : .gray.opacity(0.2))
                    if text == value {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                Text(label)
                    .font(.custom("Montserrat", size: 16))
                    .foregroundColor(.black)
            }
            .padding(6)
        }
        .buttonStyle(PlainButtonStyle()) // Eliminar el estilo de botón predeterminado
    }
}

enum FieldICCType {
    case imageForm
    case check
    case comboBox
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
            Spacer()
        }
    }
}

#Preview {
    FieldICCComponent(
        type: .comboBox,
        text: .constant(""),
        name: "Selecciona una opción",
        placeholder: "Elige una opción",
        isRequired: true,
        fontSize: .body,
        options: ["Opción 1", "Opción 2", "Opción 3", "Opción 4"]
    )
}


