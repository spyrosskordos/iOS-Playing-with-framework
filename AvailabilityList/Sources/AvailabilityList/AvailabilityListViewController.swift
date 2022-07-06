//
//  AvailabilityListViewController.swift
//
//
//  Created by Sko on 3/7/22.
//

import UIKit

class AvailabilityListViewController: UIViewController {

    private var viewModel: AvailabilityListViewModel

    init(viewModel: AvailabilityListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubSwiftUIView(AvailabilityListView(viewModel: self.viewModel), to: view)

    }

}
