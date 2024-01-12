//
//  DissmisButton.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 11.01.24.
//

import SwiftUI

struct DissmisButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

struct DissmisButton_Previews: PreviewProvider {
    static var previews: some View {
        DissmisButton()
    }
}
