//
//  File.swift
//
//
//  Created by Sko on 3/7/22.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var headers: [String: String]? { get }
}
