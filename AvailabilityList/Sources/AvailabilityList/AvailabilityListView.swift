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
            List($viewModel.availableItems) { availableItem in
                AvailabilityListRow(item: availableItem)
                    .listRowBackground(Color.pink)

            }

        }
    }

}

struct AvailabilityListRow: View {
    @Binding var item: StreamingAvailabilityItem

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.posterURLs.the92)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10.0)
                    .padding(.all, 5)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 90)
            Text(item.title)
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
