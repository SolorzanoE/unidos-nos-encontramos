//
//  TabView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 27/03/25.
//

import SwiftUI

struct TabView: View {
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        
        ZStack {
            selectedTab.view
                .frame(maxHeight: .infinity)
        }.safeAreaInset(edge: .bottom) {
            LazyVGrid(columns: gridColumns) {
                ForEach(TabItem.allCases, id: \.self) { element in
                    Button {
                        selectedTab = element
                    } label: {
                        iconTabView(iconName: element.icon, description: element.title)
                            .foregroundStyle(selectedTab == element ? .blue500 : .grey500)
                            .symbolVariant(selectedTab == element ? .fill : .none)
                    }
                }
            }.padding(10)
                .padding(.bottom, 10)
                .background(.grey50)
                .compositingGroup()
                .shadow(color: .black.opacity(0.25), radius: 10, y: -5)
        }.ignoresSafeArea(edges: .bottom)
    }
    
    var gridColumns: [GridItem] {
        var grids: [GridItem] = []
        
        TabItem.allCases.forEach { _ in
            grids.append(GridItem(.flexible()))
        }
        
        return grids
    }
    
    func iconTabView(iconName: String, description: String) -> some View {
        VStack(alignment: .center) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                
            TextComponent(text: description, style: .caption)
                .fontWeight(.medium)
                .lineLimit(1)
        }
    }
}

enum TabItem: CaseIterable {
    case search, home, contact, searchCard
    
    var icon: String {
        switch self {
        case .search: return "magnifyingglass"
        case .home: return "house"
        case .contact: return "person.text.rectangle"
        case .searchCard: return "text.document"
        }
    }
    
    var title: String {
        switch self {
        case .search:
            return "Busqueda"
        case .home:
            return "Inicio"
        case .contact:
            return "Contactos"
        case .searchCard:
            return "Ficha de busqueda"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .search:
            Text("Hola")
            //SearchPeopleView()
        case .home:
            HomeView()
        case .contact:
            Text("hola")
            //ContactView()
        case .searchCard:
            // nose
            Text("hola")
        }
    }
}

#Preview {
    TabView()
}
