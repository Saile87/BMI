//
//  SwiftData.swift
//  BMI Rechner
//
//  Created by Elias Breitenbach on 07.11.23.
//
import Foundation
import SwiftData

@Model
class BMIEingabeModul {
    
    var id: UUID
    var bmi: Double
    var date: Date
    
    init(bmi:Double, date: Date) {
        id = UUID()
        self.bmi = bmi
        self.date = date
    }
}
