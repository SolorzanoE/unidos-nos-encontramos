//
//  FormVIew.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 31/03/25.
//

import SwiftUI

// TODO: Cambiarle el nombre
struct FormView: View {
    
    // Lista de pasos del formulario
    let steps: [FormStep] = [
        FormStep(icon: .file, title: "Datos de la persona desaparecida o no localizada"),
        FormStep(icon: .person, title: "Datos de la persona que reporta"),
        FormStep(icon: .alert, title: "Acerca de los hechos"),
        FormStep(icon: .map, title: "Lugar de los hechos"),
    ]
    
    @Binding var isPresent: Bool
    @State private var activeIcons: [Bool]
    @State private var currentIndex: Int = 1
    
    init(isPresent: Binding<Bool>) {
        var initialState = Array(repeating: true, count: steps.count)
        initialState[0] = false
        _activeIcons = State(initialValue: initialState)
        _isPresent = isPresent
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
                    
                    TextComponent(text: titleForm, style: .subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white400)
                        .fontWeight(.medium)
                        .padding(.top, 20)
                    
                    ScrollView {
                        formViews
                            .padding(.horizontal)
                    }.scrollIndicators(.hidden)
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity)
                        .background(Color.white500)
                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
                }
                
            }.safeAreaInset(edge: .bottom) {
                bottomButtons
            }.safeAreaInset(edge: .top) {
                Button(action: {
                        
                    }) {
                        NavigationButtonComponent(style: .exit) {
                            isPresent = false 
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
    
    @ViewBuilder
    var formViews: some View {
        switch currentIndex {
        case 1:
            PersonalInformationForm()
        case 2:
            ContactInformationForm()
        case 3:
            PhysicalCharacteristicsForm()
        case 4:
            AccountForm()
        case 5:
            CommitForm()
        default:
            EmptyView()
        }
    }
    
    let formFields: [Int: [FieldComponent]] = [
        1: [
            FieldComponent(type: .textField, name: "Nombre", placeholder: "Ingrese el nombre", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Apellido Paterno", placeholder: "Ingrese el apellido paterno", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Apellido Materno", placeholder: "Ingrese el apellido materno", text: .constant(""), fontSize: .body),
            FieldComponent(type: .textField, name: "Lugar de Nacimiento", placeholder: "Seleccione el lugar de nacimiento", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "Sexo", placeholder: "Seleccione su sexo", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "CURP (Clave Única de Registro de Población)", placeholder: "Ingrese la CURP", text: .constant(""), fontSize: .body),
            FieldComponent(type: .textField, name: "Nacionalidad", placeholder: "Seleccione la nacionalidad", text: .constant(""),isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Estado Civil", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "Fecha de Nacimiento", placeholder: "Ingrese la fecha de nacimiento", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "¿Sabe leer o escribir?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "¿Está embarazada?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "Meses de Emabrazo", placeholder: "Ingrese los meses de embarazo", text: .constant(""), fontSize: .body),
            FieldComponent(type: .textField, name: "RFC", placeholder: "Ingrese el RFC", text: .constant(""), fontSize: .body),
            FieldComponent(type: .textField, name: "Escolaridad", placeholder: "Seleccione una opción", text: .constant(""), fontSize: .body),
            
        ],
        2: [
            FieldComponent(type: .textField, name: "¿Desea que sus datos sean anónimos?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "¿Cuál es su relación con la persona?", placeholder: "Seleccione una opción", text: .constant(""), fontSize: .body),
            
        ],
        3: [
            FieldComponent(type: .textField, name: "Fecha y Hora de los Hechos", placeholder: "Ingrese la fecha y hora", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Fecha y Hora en la que se Percató", placeholder: "Ingrese la fecha y hora", text: .constant(""), fontSize: .body),
            FieldComponent(type: .textField, name: "Circunstancia", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textArea, name: "Descripción de los Hechos", placeholder: "Ingrese la descripción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "¿Acompañaba usted a la persona?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body),
            FieldComponent(type: .textField, name: "Hipótesis del Paradero", placeholder: "Ingrese la hipótesis", text: .constant(""), isRequired: true, fontSize: .body),
        ],
        4: [
            FieldComponent(type: .textField, name: "Tipo de Domicilio", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Calle", placeholder: "Ingrese la calle", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Número Exterior", placeholder: "Ingrese el número exterior", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Número Interior", placeholder: "Ingrese el número interior", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Entre Calles", placeholder: "Ingrese la calle", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Estado", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Municipio o Alcaldía", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Colonia", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textField, name: "Código Postal", placeholder: "Ingrese el código postal", text: .constant(""), isRequired: true, fontSize: .body),
            FieldComponent(type: .textArea, name: "Referencia Geográfica", placeholder: "Referencia", text: .constant(""), isRequired: true, fontSize: .body),
            //Mapa
            FieldComponent(type: .textArea, name: "Tramo Carretero", placeholder: "Ingrese el tramo carrtero", text: .constant(""), isRequired: true, fontSize: .body),
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
                    isPresent.toggle()
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




#Preview {
    FormView(isPresent: .constant(false))
}
