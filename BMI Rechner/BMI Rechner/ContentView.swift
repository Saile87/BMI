//
//  ContentView.swift
//  BMI Rechner
//
//  Created by Elias Breitenbach on 30.10.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gewichtEingabe = ""
    @State private var groesseEingabe = ""
    
    var body: some View {
        let bmi = berechneterBMI()
        VStack {
            HStack {
                Text("Gewicht")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("kg", text: $gewichtEingabe)
                    .frame(maxWidth: 50)
            }
            
            HStack {
                Text("Größe")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("m", text: $groesseEingabe)
                    .frame(maxWidth: 50)
            }
            HStack {
                Text("BMI")
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let bmi = bmi {
                    Gauge(value: bmi, in: 15.5...27.9) {
                        Text("BMI")
                    } currentValueLabel: {
                        Text("\(String(format: "%.1f", bmi))")
                    }
                    .gaugeStyle(.accessoryCircular)
                }
            }
//            HStack {
//                Text("BMI")
//                    .padding(1)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                
//                if let bmi = bmi {
//                    Text("\(String(format: "%.1f", bmi))")
//                    
//                } else if !gewichtEingabe.isEmpty && !groesseEingabe.isEmpty {
//                    Text("Error")
//                }
//            }
            HStack {
                Button("Speichern") {
                    
                }
                .disabled(bmi == nil)
//                dadurch ist der Speichern Button ausgegraut und erst wenn Gewicht und Größe ausgefüllt werden
//                wird der Button auf Blau umspringen.
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .font(.title)
        .frame(width: 250)
        .keyboardType(.decimalPad)
    }
    func berechneterBMI() -> Double? {
        if let gewicht = Double(gewichtEingabe),
           let groesse = Double(groesseEingabe) {
            
            if (groesse > 0) && (gewicht > 0) {
                //            die klammern sind nur Optisch für besseres lesen, sind aber nicht notwendig!
                return gewicht / (groesse * groesse)
            }
        }
        return nil
    }
}

#Preview {
    ContentView()
}
