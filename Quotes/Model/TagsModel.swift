//
//  TagsModel.swift
//  Quotes
//
//  Created by Dalveer singh on 28/06/22.
//

import Foundation
struct TagsModel:Decodable,Identifiable{
    let id = UUID()
    let _id:String
    let name:String
    let quoteCount:Int
    enum CodingKeys: String ,CodingKey{
        case _id,name,quoteCount
    }
}
