//
//  SmallAddButton.swift
//  ToDo
//
//  Created by Luiz Eduardo Barros Coelho on 26/07/23.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 0.328, saturation: 0.796, brightness: 0.488))
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                
        }
        .frame(height: 50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
