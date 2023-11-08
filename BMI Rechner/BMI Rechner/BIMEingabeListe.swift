//
//  BIMEingabeListe.swift
//  BMI Rechner
//
//  Created by Elias Breitenbach on 07.11.23.
//

import Foundation
import SwiftData
import SwiftUI

struct BMIEngabeListeView: View {
    
    @Query(sort: \BMIEingabeModul.date) private var BmiEingaben: [BMIEingabeModul]
    
    var body: some View {
        List(BmiEingaben) { BmiEingabe in
            Text("\(String(format: "%.1f", BmiEingabe.bmi))")
        }
    }
}

#Preview {
    BMIEngabeListeView()
}
