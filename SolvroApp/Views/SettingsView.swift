//
//  SettingsView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: UIColor(red: 0.949, green: 0.949, blue: 0.968, alpha: 1.0))
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    Spacer()
                    HStack(spacing: 50) {
                        Link(destination: URL(string: "https://github.com/jakubchojak")!) {
                            Image("github_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 70, maxHeight: 70)
                        }
                        
                        Link(destination: URL(string: "https://www.linkedin.com/in/jakub-chojak-282308203/")!) {
                            Image("linkedin_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 60, maxHeight: 60)
                        }
                    }
                    Text("Jakub Chojak, 2023")
                }
                .padding()
            }
            .navigationTitle("Ustawienia")
        }
    }
}
