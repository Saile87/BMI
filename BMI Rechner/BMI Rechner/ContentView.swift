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
        VStack {
            TextField("Gewicht in kg", text: $gewichtEingabe)
            TextField("Größe in Meter", text: $groesseEingabe)
            HStack {
            Text("\(berechneterBMI() ?? 0)")
                Button("Speichern") {
                }
            }
        }
        .font(.title)
        .frame(width: 200)
        .keyboardType(.decimalPad)
    }
    func berechneterBMI() -> Double? {
        let gewicht = Double(gewichtEingabe) ?? 0
        let groesse = Double(groesseEingabe) ?? 0
        
        if (groesse > 0) && (gewicht > 0) {
//            die klammern sind nur Optisch für besseres lesen, sind aber nicht notwendig!
            return gewicht / (groesse * groesse)
        }
        return nil
    }
}

#Preview {
    ContentView()
}
