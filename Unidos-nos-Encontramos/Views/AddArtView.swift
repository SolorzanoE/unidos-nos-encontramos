//
//  AddAlertView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct Alarm: Identifiable {
    let id = UUID()
    var time: Date
    var isActive: Bool
}

struct AlarmView: View {
    @State private var alarms: [Alarm] = []
    @State private var selectedTime = Date()

    var body: some View {
        NavigationView {
            VStack {
                // Selector de hora para nueva alarma
                DatePicker("Selecciona una hora", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .padding()

                // Botón para agregar una nueva alarma
                Button(action: {
                    let newAlarm = Alarm(time: selectedTime, isActive: true)
                    alarms.append(newAlarm)
                }) {
                    Text("Agregar Alarma")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                // Lista de alarmas agregadas
                List {
                    ForEach(alarms) { alarm in
                        HStack {
                            Text(alarm.time, style: .time)
                                .font(.headline)

                            Spacer()

                            // Toggle para activar/desactivar la alarma
                            Toggle("", isOn: binding(for: alarm))
                                .labelsHidden()
                        }
                    }
                    .onDelete(perform: deleteAlarm)
                }
            }
            .navigationTitle("Mis Alarmas")
        }
    }

    // Encuentra el índice de la alarma y lo enlaza al estado
    private func binding(for alarm: Alarm) -> Binding<Bool> {
        guard let index = alarms.firstIndex(where: { $0.id == alarm.id }) else {
            return .constant(false)
        }
        return $alarms[index].isActive
    }

    // Función para eliminar alarmas
    private func deleteAlarm(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
}

#Preview {
    AlarmView()
}
