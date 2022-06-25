//
//  QuotesDetail.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct QuotesDetail: View {
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            QuotesCardView()
                .offset(y:12)
            CustomTitleView(titleText: "Author")
            CustomTitleView(titleText: "Tags")
                .padding(.top,8)
            AuthorNameView(author: "Albert En")
            QuoteTagsView(tags: ["information"])
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("Quotes Details"))
    }
}

struct QuotesDetail_Previews: PreviewProvider {
    static var previews: some View {
        QuotesDetail()
    }
}
