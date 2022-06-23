//
//  ViewController.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 19/6/22.
//

import UIKit

class MenuViewController: UIViewController {
    private var viewModel: MenuViewModel
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubSwiftUIView(MenuView(), to: view)
    }
    
    
}

