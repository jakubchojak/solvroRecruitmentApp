//
//  FinderView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 21/03/2023.
//

import SwiftUI

struct FinderView: View {
    @Binding var beerToFind: String
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(uiColor: UIColor(red: 0.8, green: 0.82, blue: 0.88, alpha: 1.0)))
                    .frame(maxHeight: 40)
                HStack {
                    TextField("Wpisz nazwę piwa do wyszukania", text: $beerToFind)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.forward")
                    }
                }
                .padding(.leading)
                .padding(.trailing)
            }
            .padding()
    }
}

