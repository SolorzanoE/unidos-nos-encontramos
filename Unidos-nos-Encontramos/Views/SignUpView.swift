//
//  SignUpView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 27/03/25.
//

import SwiftUI

struct SignUpView: View {
    
    // Lista de pasos del formulario
    let steps: [FormStep] = [
        FormStep(icon: .person, title: "Información Personal"),
        FormStep(icon: .mail, title: "Información de contacto"),
        FormStep(icon: .heart, title: "Características físicas"),
        FormStep(icon: .key, title: "Cuenta"),
        FormStep(icon: .file, title: "Aviso de privacidad")
    ]
    
    @State private var activeIcons: [Bool]
    @State private var currentIndex: Int = 1
    @State private var navigateToMain = false
    
    init() {
        var initialState = Array(repeating: true, count: steps.count)
        initialState[0] = false
        _activeIcons = State(initialValue: initialState)
    }

    var body: some View {
        let titleForm = steps[currentIndex - 1].title
        NavigationStack {
            ZStack(alignment: .top) {
                
                ZStack {
                    BackgroundComponent(style: .gradientSkyBlue)
                    
                    
                }.safeAreaInset(edge: .bottom) {
                    BackgroundComponent(style: .white)
                        .padding(.top,400)
                }
                VStack {
                    
                    ProgressHeaderView(steps: steps, activeIcons: activeIcons)
                    
                    TextComponent(text: titleForm, style: .headline)
                        .foregroundStyle(.white400)
                        .fontWeight(.medium)
                        .padding(.top, 20)
                    
                    Form {
                        ScrollView {
                            VStack(spacing: 17) {
                                if let fields = formFields[currentIndex] {
                                    ForEach(fields.indices, id: \.self) { index in
                                        fields[index]
                                    }.padding(.horizontal)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .clipped()
                    }
                        .padding(.top,25)
                        .formStyle(.columns)
                        .background(Color.white500)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    
                }
                
            }.safeAreaInset(edge: .bottom) {
                bottomButtons
            }.safeAreaInset(edge: .top) {
                NavigationButtonComponent(style: .exit)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }.fullScreenCover(isPresented: $navigateToMain) {
                MainView()
            }
        }
    }
    
    let formFields: [Int: [FieldComponent]] = [
        1: [
            FieldComponent(type: .textField, name: "Nombre", placeholder: "Ingrese su nombre", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Apellido Paterno", placeholder: "Ingrese su apellido paterno", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Apellido Materno", placeholder: "Ingrese su apellido materno", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Nacionalidad", placeholder: "Seleccione su nacionalidad", text: .constant(""),isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Fecha de Nacimiento", placeholder: "Ingrese su fecha de nacimiento", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "Lugar de Nacimiento", placeholder: "Seleccione su lugar de nacimiento", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "Sexo", placeholder: "Seleccione su sexo", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Género", placeholder: "Seleccione su género", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "CURP (Clave Única de Registro de Población)", placeholder: "Ingrese su CURP", text: .constant(""), fontSize: .body),
        ],
        2: [
            FieldComponent(type: .textField, name: "Número de Telefono", placeholder: "Ingrese su número de telefono", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Correo Electrónico", placeholder: "Ingrese su correo electrónico", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Dirección", placeholder: "Ingrese su dirección", text: .constant(""), isRequired: true, fontSize: .body)
        ],
        3: [
            FieldComponent(type: .textField, name: "Estatura (cm)", placeholder: "Ingresa tu estatura", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Peso Corporal (Kg)", placeholder: "Ingrese su peso", text: .constant(""), fontSize: .body),
            FieldComponent(type: .textField, name: "Color de Ojos", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Color de Piel", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Complexión", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Tipo de Cabello", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
        ],
        4: [
            FieldComponent(type: .textField, name: "Fotografía", placeholder: "", text: .constant(""), fontSize: .body),
            FieldComponent(type: .secureField(.show), name: "Contraseña", placeholder: "Ingrese una contraseña", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .secureField(.show), name: "Ingrese nuevamente su contraseña", placeholder: "Repita su contraseña", text: .constant(""), isRequired: true, fontSize: .body)
        ],
        5: [
            FieldComponent(type: .textArea, name: "Aceptar términos", placeholder: "", text: .constant(""), fontSize: .body)
        ]
    ]
    
    var bottomButtons: some View {
        HStack(spacing: 20) {
            if currentIndex > 1 {
                FormButtonComponent(style: .back) {
                    previousIcon()
                }
            }
            Spacer()
            if currentIndex == steps.count {
                FormButtonComponent(style: .acept) { // Cambia a botón de "Aceptar"
                    navigateToMain = true
                }
            } else {
                FormButtonComponent(style: .next) {
                    nextIcon()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
    private func nextIcon() {
        if currentIndex < steps.count {
            activeIcons[currentIndex] = false
            currentIndex += 1
        }
    }

    // Retrocede al ícono anterior
    private func previousIcon() {
        if currentIndex > 1 {
            currentIndex -= 1
            activeIcons[currentIndex] = true
        }
    }
}

// Línea de progreso
struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

#Preview {
    SignUpView()
}
