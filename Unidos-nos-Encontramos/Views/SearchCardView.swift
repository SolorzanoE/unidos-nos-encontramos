//
//  SearchCardView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct SearchCardView: View {
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            CircleButtonComponent(style: .red, systemImage: "exclamationmark")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding([.trailing, .bottom])
        }
    }
}

#Preview {
    SearchCardView()
}
