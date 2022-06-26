//
//  TagFilteredQuoteListView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct TagFilteredQuoteListView: View {
    @Environment(\.colorScheme) var colorScheme
    var tagName:String
    var quoteCount:Int
    var body: some View {
        HStack{
            Spacer()
            VStack(alignment:.center)
            {
                Text(tagName.uppercased())
                    .font(.title2)
                    .bold()
                Text("Quote Count : \(quoteCount)")
                    .font(.caption)
                    .italic()
                    .foregroundColor(colorScheme == .dark ? .white.opacity(0.7) : .black.opacity(0.5))
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 20))
        .frame(height:100)
        .background(Constants.appSecondary)
        .cornerRadius(10)
    }
}

struct TagFilteredQuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        TagFilteredQuoteListView(tagName: "technology", quoteCount: 1234)
            .previewLayout(.sizeThatFits)
    }
}
