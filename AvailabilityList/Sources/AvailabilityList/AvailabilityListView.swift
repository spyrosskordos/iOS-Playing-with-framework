//
//  SwiftUIView.swift
//
//
//  Created by Sko on 3/7/22.
//

import SwiftUI

struct AvailabilityListView: View {
    let viewModel: AvailabilityListViewModel
    var body: some View {
        ZStack {
            Color.red
        }.onAppear {
            viewModel.fetchAllAvailableItems()
        }

    }
}

//struct AvailabilityListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvailabilityListView(viewModel: AvailabilityListViewModel())
//    }
//}
