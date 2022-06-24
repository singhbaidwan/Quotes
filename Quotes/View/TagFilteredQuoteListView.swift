//
//  TagFilteredQuoteListView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct TagFilteredQuoteListView: View {
    var body: some View {
        
        VStack{
            Text("Bussinesss")
                .lineLimit(1)
            Text("Tweet Count :-")
        }
        .frame(width: 200, height: 200)
        .background(Constants.appSecondary)
    }
}

struct TagFilteredQuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        TagFilteredQuoteListView()
            .previewLayout(.sizeThatFits)
    }
}
