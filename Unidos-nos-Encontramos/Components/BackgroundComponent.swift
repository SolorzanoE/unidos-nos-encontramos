//
//  BackgroundComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 25/03/25.
//

import SwiftUI

struct BackgroundComponent: View {
    
    var style: Style
    
    var body: some View {
        
        ZStack {
            styleBackground.ignoresSafeArea()
        }
    }
    
    var styleBackground: some View {
        Group {
            switch style {
            case .white:
                Color.white500
            case .gradientSkyBlue:
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .blue500, location: 0.05),
                        .init(color: .skyBlue600, location: 0.4)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            case .gradientOceanBlue:
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .blue500, location: 0.5),
                        .init(color: .skyBlue700, location: 0.9)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }
    }
    
    enum Style {
        case white
        case gradientSkyBlue
        case gradientOceanBlue
    }
}

#Preview {
    BackgroundComponent(style: .gradientOceanBlue)
}
