//
//  ContentView.swift
//  BMI Rechner
//
//  Created by Elias Breitenbach on 30.10.23.
//

import SwiftUI
import SwiftData

struct BMIRechnerView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var gewichtEingabe = ""
    @State private var groesseEingabe = ""
    
    var body: some View {
        let bmi = berechneterBMI()
        ZStack {
            VStack {
                
                GroesseInput(gewichtEingabe: $gewichtEingabe)
                GewichtInput(groesseEingabe: $groesseEingabe)
                BMIView(bmi: bmi)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .frame(width: 250, height: 175)
            .keyboardType(.decimalPad)
            
            Button("Speichern") {
                let bmiEnter = BMIEingabeModul(bmi: bmi!, date: Date())
                    modelContext.insert(bmiEnter)
            }
            .disabled(bmi == nil)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
        }
        .font(.title)

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

struct GroesseInput: View {
    
    @Binding var gewichtEingabe: String
    
    var body: some View {
        HStack {
            Text("Gewicht")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("kg", text: $gewichtEingabe)
                .frame(maxWidth: 50)
        }
    }
}

struct GewichtInput: View {
    
    @Binding var groesseEingabe: String
    
    var body: some View {
        HStack {
            Text("Größe")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("m", text: $groesseEingabe)
                .frame(maxWidth: 50)
        }
    }
}

struct BMIView: View {
    
    var bmi: Double?
    
    var body: some View {
        ZStack {
            Text("BMI")
                .frame(maxWidth: .infinity, alignment: .leading)
            if let bmi = bmi {
                Gauge(value: bmi, in: 15.7...27.9) {
                    
                } currentValueLabel: {
                    Text("\(String(format: "%.1f", bmi))")
                }
                .gaugeStyle(.accessoryCircular)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    BMIRechnerView()
        .modelContainer(for: [BMIEingabeModul.self], inMemory: true)
}
