//
//  HomeView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 27/03/25.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var isPresented: Bool = false
    
    @State private var onTrayect: Bool = true
    
    @State private var seeTrayect: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Map(position: $position) {
                
            }.mapStyle(.standard(pointsOfInterest: .excludingAll))
            
            HStack {
                
                if onTrayect {
                    VStack(alignment: .leading, spacing: 10) {
                        TextComponent(text: "Trayecto en curso...", style: .subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.grey500)
                        
                        TextComponent(text: "Tiempo estimado: 8 min", style: .body)
                            .fontWeight(.medium)
                            .foregroundStyle(.red500)
                        HStack {
                            TextComponent(text: "1.7 km - \(formattedCurrentDate())", style: .body)
                                .fontWeight(.medium)
                                .foregroundStyle(.grey500)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                TextComponent(text: "Finalizar", style: .callout)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white500)
                                    .padding(5)
                            }.background(.blue500)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.white.opacity(0.7))
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .clipped()
                } else {
                    JourneyButtonComponent(text: "Iniciar Trayecto") {
                        isPresented.toggle()
                    }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white500)
                        .frame(maxWidth: 35)
                }.frame(maxWidth: 45, maxHeight: 45)
                    .padding()
                    .background(.yellow600)
                    .clipShape(Circle())
            }.padding(.horizontal)
        }.sheet(isPresented: $isPresented) {
            CheckTrayect()
                .presentationDetents([.fraction(0.8)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(25)
        }.safeAreaInset(edge: .top) {
            if seeTrayect {
                HStack(spacing: 50) {
                    VStack(alignment: .leading, spacing: 10) {
                        TextComponent(text: "2 trayectos en curso", style: .subheadline)
                            .fontWeight(.medium)
                        
                        TextComponent(text: "Alberto, Eduardo", style: .body)
                            .fontWeight(.medium)
                    }.padding(.vertical, 10)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.backward")
                            .fontWeight(.bold)
                            .rotationEffect(.degrees(180))
                            .foregroundStyle(.grey900)
                    }
                }.padding(.horizontal)
                    .background(.white.opacity(0.5))
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
        }
    }
}

func formattedCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"  // Puedes cambiar este formato según lo que necesites
        return formatter.string(from: Date())
    }

#Preview {
    HomeView()
}
