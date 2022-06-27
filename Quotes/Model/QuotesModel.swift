//
//  QuotesModel.swift
//  Quotes
//
//  Created by Dalveer singh on 26/06/22.
//

import Foundation
struct QuotesModel : Decodable,Identifiable{
    let id = UUID()
    var totalCount:Int
    var page:Int
    var results:[Quote]
    enum CodingKeys: String, CodingKey {
        case totalCount, page , results
    }
    
}
struct Quote:Decodable,Identifiable{
    let id = UUID()
    let tags:[String]
    let _id:String
    let author:String
    let content:String
    let authorSlug:String
    enum CodingKeys: String, CodingKey {
        case tags, _id , content , author , authorSlug
    }
}
