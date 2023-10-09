//
//  ViewExtensions.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 28/09/23.
//

import Foundation
import SwiftUI

extension View {
    func customBackground() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                                   gradient: Gradient(colors: [.blue, .white]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
            )
            .ignoresSafeArea()
    }
}
