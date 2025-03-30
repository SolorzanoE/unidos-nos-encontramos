//
//  SidebarView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var isPresent: Bool
    @Binding var element: SideElement
    @AppStorage("isLogged") private var isLogged = false
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color.black.opacity(0.65).ignoresSafeArea()
                .onTapGesture {
                    isPresent = false
                }
            
            if isPresent {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                        
                        VStack(alignment: .leading) {
                            TextComponent(text: "Eduardo Solorzano Santos", style: .body)
                                .fontWeight(.medium)
                            
                            TextComponent(text: "Drdslrzn@gmail.com", style: .caption)
                        }.lineLimit(1)
                    }.foregroundStyle(.white50)
                    
                    DividerComponent()
                        .foregroundStyle(.skyBlue200)
                    
                    VStack(spacing: 25) {
                        ForEach(SideElement.allCases, id: \.self) { sideButton in
                            sideButton.button(isSelected: element == sideButton ? true : false) {
                                element = sideButton
                                isPresent.toggle()
                            }
                        }
                    }
                    
                    Spacer()
                    
                    DividerComponent()
                        .foregroundStyle(.skyBlue200)
                    
                    SideButtonComponent(style: .close) {
                        isLogged = false
                        isPresent = false
                        element = .home
                    }
                }.padding(.horizontal)
                    .background(BackgroundComponent(style: .gradientOceanBlue))
                    .frame(width: 240)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

enum SideElement: CaseIterable {
    case home
    case alert
    case configuration
    
    func button(isSelected: Bool, action: @escaping () -> Void) -> some View {
        switch self {
        case .home:
            SideButtonComponent(isPressed: isSelected, style: .home, action: action)
        case .alert:
            SideButtonComponent(isPressed: isSelected, style: .alert, action: action)
        case .configuration:
            SideButtonComponent(isPressed: isSelected, style: .configuration, action: action)
        }
    }
}

#Preview {
    SidebarView(isPresent: .constant(true), element: .constant(.home))
}
