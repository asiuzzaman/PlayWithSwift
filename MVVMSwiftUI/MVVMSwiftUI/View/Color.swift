//
//  Color.swift
//  MVVMSwiftUI
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import SwiftUICore

extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
