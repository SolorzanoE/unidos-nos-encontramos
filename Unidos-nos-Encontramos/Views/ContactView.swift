//
//  ContactView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct ContactView: View {
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            VStack {
                CircleBadgeButtonComponent(systemImage: "tray.fill", numberBadge: 5)
                
                CircleButtonComponent(style: .blue, systemImage: "plus")
            }.frame(maxWidth: .infinity, alignment: .trailing)
                .padding([.trailing, .bottom])
        }
    }
}

#Preview {
    ContactView()
}
