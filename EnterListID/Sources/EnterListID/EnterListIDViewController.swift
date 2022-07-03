//
//  EnterListIDViewController.swift
//  
//
//  Created by Sko on 23/6/22.
//

import UIKit
import PWFCommon
class EnterListIDViewController: UIViewController {

    private var viewModel: EnterListIDViewModel
    init(viewModel: EnterListIDViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        addSubSwiftUIView(EnterListIDView(), to: view)
    }
    
}
