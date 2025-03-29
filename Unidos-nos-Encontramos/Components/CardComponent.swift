//
//  CardComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 26/03/25.
//

import SwiftUI

struct CardComponent: View {
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                Text("Eduardo Solorzano Santos")
                Text("9622696188")
            }
            
            Spacer()
            
            VStack {
                Text("amigo")
                
                Image(systemName: "star.fill")
                    .foregroundStyle(.grey100)
            }
        }.padding()
            .background(.blue500)
            .foregroundStyle(.white50)
    }
}

#Preview {
    CardComponent()
}
