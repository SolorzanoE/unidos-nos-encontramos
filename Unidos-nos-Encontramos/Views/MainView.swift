//
//  MainView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("isLogged") private var isLogged = false
    @State private var sideIsPresent = false
    @State private var sideElement: SideElement = .home
    
    var body: some View {
        
        ZStack {
            
            if isLogged {
                Sidebar(element: $sideElement)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .safeAreaInset(edge: .top, alignment: .leading) {
                        MenuComponent(isSelected: $sideIsPresent, size: 40)
                            .padding(.leading)
                    }
            } else {
                LoginView()
            }
            
            if sideIsPresent && isLogged {
                SidebarView(isPresent: $sideIsPresent, element: $sideElement)
            }
        }
    }
}

private struct Sidebar: View {
    
    @Binding var element: SideElement
    
    var body: some View {
        screen
    }
    
    @ViewBuilder
    var screen: some View {
        switch element {
        case .home:
            TabView()
        case .alert:
            Text("a")
        case .configuration:
            Text("a")
        }
    }

}

#Preview {
    MainView()
}
