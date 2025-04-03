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
    
    @AppStorage("isLogged") private var isLogged: Bool = false
    
    @State private var activeIcons: [Bool]
    @State private var currentIndex: Int = 1
    @Binding var isPresent: Bool
    
    init(isPresent: Binding<Bool>) {
        var initialState = Array(repeating: true, count: steps.count)
        initialState[0] = false
        _activeIcons = State(initialValue: initialState)
        _isPresent = isPresent;
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
                NavigationButtonComponent(style: .exit) {
                    isPresent.toggle()
                }.frame(maxWidth: .infinity, alignment: .trailing)
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
    
    var bottomButtons: some View {
        HStack {
            
            if currentIndex > 1 {
                FormButtonComponent(style: .back) {
                    previousIcon()
                }
            }
            
            Spacer()
            
            if currentIndex == steps.count {
                FormButtonComponent(style: .acept) { // Cambia a botón de "Aceptar"
                    isPresent = true
                    isLogged = true
                }
            } else {
                FormButtonComponent(style: .next) {
                    nextIcon()
                }
            }
        }.padding(.horizontal)
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
    SignUpView(isPresent: .constant(false))
}
