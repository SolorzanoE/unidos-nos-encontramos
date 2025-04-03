//
//  AddAlertView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct AddAlertView: View {
    @State private var selectedTime = Date()
    var body: some View {
        ZStack{
            BackgroundComponent(style: .gradientSkyBlue)
            VStack{
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    .padding()
                    .environment(\.colorScheme, .dark)
                Spacer()

            }
        }
    }
}

#Preview {
    AddAlertView()
}
