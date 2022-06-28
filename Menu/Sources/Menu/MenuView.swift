//
//  MenuView.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 19/6/22.
//

import SwiftUI
import PWFCommon

struct MenuView: View {
  @ObservedObject  var viewModel: MenuViewModel
    var body: some View {
        NavigationView {
            VStack {
                Button("List With Combine") {
                    viewModel.listTapped()
                }
                .buttonStyle(PWFRadiusButtonStyle())
                Spacer()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuViewModel(coordinator: MockMenuCoordinator()))
    }
}

