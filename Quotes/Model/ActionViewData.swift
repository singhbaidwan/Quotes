//
//  ActionViewData.swift
//  Quotes
//
//  Created by Dalveer singh on 30/06/22.
//

import Foundation

import SwiftUI

struct ActionViewData: Identifiable {
    let id = UUID()
    let type: String
    let image: UIImage!
    let text: String!
    let color: Color!
    let title: String!
    let toggleView: String!
}

struct CategoryData: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}
