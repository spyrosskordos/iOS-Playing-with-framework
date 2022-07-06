//
//  SwiftUIView.swift
//
//
//  Created by Sko on 3/7/22.
//

import SwiftUI

struct TT: Identifiable, Hashable {
    let id = UUID()

}
struct AvailabilityListView: View {
    @StateObject var viewModel: AvailabilityListViewModel
    var body: some View {
        ZStack {
            List(viewModel.availableItems) { availableItem in
                Text(availableItem.title).foregroundColor(.red)
            }
        }
    }

}

struct AvailabilityListView_Previews: PreviewProvider {
    static var previews: some View {
        AvailabilityListView(
            viewModel: AvailabilityListViewModel(
                coordinator: MockAvailabilityListCoordinatorImpl(),
                apiService: StreamingAvailabilityAPIService()))
    }
}
