//
//  SignUpView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 27/03/25.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack{
            BackgroundComponent(style: .gradientSkyBlue)
            
            Rectangle()
                .stroke(style: .init(lineWidth: 1 ,dash: [10]))
        }
    }
}

#Preview {
    SignUpView()
}
