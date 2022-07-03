//
//  VC+Extension.swift
//  PlayingWithFrameworks
//
//  Created by Sko on 19/6/22.
//

import Foundation
import UIKit
import SwiftUI

public extension UIViewController {
    func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content: View {

        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.backgroundColor = .clear
        addChild(hostingController)

        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        hostingController.didMove(toParent: self)
    }
}
