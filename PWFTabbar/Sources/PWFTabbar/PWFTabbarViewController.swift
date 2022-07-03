//
//  PWFTabbarViewController.swift
//  
//
//  Created by Sko on 3/7/22.
//

import UIKit

class PWFTabbarViewController: UITabBarController {
    private var viewModel: PWFTabbarViewModel
    init(viewModel: PWFTabbarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
