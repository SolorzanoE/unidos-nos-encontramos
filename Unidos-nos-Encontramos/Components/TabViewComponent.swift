//
//  TabViewComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 26/03/25.
//

import SwiftUI

enum TabItem: CaseIterable {
    case search, home, profile, document
    
    var icon: String {
        switch self {
        case .search: return "magnifyingglass"
        case .home: return "house.fill"
        case .profile: return "person.text.rectangle"
        case .document: return "text.document"
        }
    }
    var title: String {
        switch self {
        case .search:
            return "Busqueda"
        case .home:
            return "Inicio"
        case .profile:
            return "Contactos"
        case .document:
            return "Ficha de busqueda"
        }
    }
}

struct CustomTab: View {
    var tab: TabItem
    @Binding var selectedTab: TabItem?
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            selectedTab = (selectedTab == tab) ? nil : tab
            action()
        }) {
            VStack{
                Image(systemName: tab.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    
                TextComponent(text: tab.title, style: .caption)
                    .fontWeight(.medium)
            }
            .frame(height: 64)
            .foregroundColor(selectedTab == tab ? .blue500 : .grey500)
        }
        .animation(.easeInOut(duration: 0.2), value: selectedTab)
    }
}

struct TabViewComponent: View {
    @State private var selectedTab: TabItem? = nil
    
    var body: some View {
        HStack{
    
            CustomTab(tab: .search, selectedTab: $selectedTab)
            Spacer()
            CustomTab(tab: .home, selectedTab: $selectedTab)
            Spacer()
            CustomTab(tab: .profile, selectedTab: $selectedTab)
            Spacer()
            CustomTab(tab: .document, selectedTab: $selectedTab)
           
        }.padding(.horizontal)
        .background(.grey50)
        .clipShape(Rectangle())
        .frame(maxWidth: .infinity, minHeight: 64)
        .shadow(radius:3, y: -3)
    
    }
}

#Preview {
    TabViewComponent()
}
