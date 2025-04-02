//
//  FormStepComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 31/03/25.
//

import SwiftUI

// Modelo para cada paso del formulario
struct FormStep {
    let icon: IconStyle
    let title: String
}

struct ProgressHeaderView: View {
    let steps: [FormStep]
    let activeIcons: [Bool]

    var body: some View {
        ZStack {
            let iconSize: CGFloat = 45
            let spacing: CGFloat = 24
            let lineWidth = CGFloat(steps.count) * iconSize + CGFloat(steps.count - 1) * spacing

            // Línea de progreso
            HLine()
                .stroke(.white50, style: StrokeStyle(lineWidth: 2, dash: [5, 4]))
                .frame(width: lineWidth, height: 2)

            // Íconos de los pasos
            HStack(spacing: spacing) {
                ForEach(steps.indices, id: \.self) { index in
                    IconComponent(changeColor: activeIcons[index], style: steps[index].icon)
                        .frame(width: iconSize, height: iconSize)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
}

#Preview {
    ProgressHeaderView(steps: [.init(icon: .alert, title: "pene")], activeIcons: [true, true])
}
