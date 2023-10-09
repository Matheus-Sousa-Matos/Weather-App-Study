//
//  TextExtensions.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 28/09/23.
//

import Foundation
import SwiftUI

extension Text {
    func customTitleStyle(fontSize: CGFloat = 20, fontWeight: Font.Weight = .ultraLight, trailingPadding: CGFloat = 0, leadingPadding: CGFloat = 0, bottomPadding: CGFloat = 0, topPadding: CGFloat = 0) -> some View {
        self
            .font(.system(size: fontSize, weight: fontWeight, design: .monospaced))
            .foregroundColor(.black)
            .padding(.trailing, trailingPadding)
            .padding(.leading, leadingPadding)
            .padding(.top, topPadding)
            .padding(.bottom, bottomPadding)
    }
}
