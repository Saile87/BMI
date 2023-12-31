//
//  BMI_RechnerApp.swift
//  BMI Rechner
//
//  Created by Elias Breitenbach on 30.10.23.
//

import SwiftUI

@main
struct BMI_RechnerApp: App {
    var body: some Scene {
        WindowGroup {
            Group {
                TabView {
                    BMIRechnerView()
                        .tabItem {
                            Text("Rechner")
                        }
                    BMIEngabeListeView()
                        .tabItem {
                            Text("Liste")
                        }
                }
            }
                .modelContainer(for: [BMIEingabeModul.self])
        }
    }
}
