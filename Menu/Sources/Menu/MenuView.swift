//
//  MenuView.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 19/6/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button("List With Combine") {
                }
                .buttonStyle(PWFRadiusButtonStyle())
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
