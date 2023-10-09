//
//  IconDataView.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 27/09/23.
//

import SwiftUI

struct iconDataView: View {
    var nameImage: String
    var data: Double
    var sufix: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(nameImage)")
                .foregroundColor(.black)
                .font(.system(size: 32, weight: .ultraLight, design: .monospaced))
                .padding(2)
            Text("\(data.formatWithInt())\(sufix)")
                .font(.system(size: 16, weight: .ultraLight, design: .monospaced))
                .foregroundColor(.black)
        }
    }
}

extension Double {
    func formatWithInt() -> String {
        let numInt = Int(self)
        return String(numInt)
    }
}
