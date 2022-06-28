//
//  QuotesDetail.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct QuotesDetail: View {
    var quote : Quote
    var showAuthorLink = true
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false)
        {
            QuotesCardView(text: quote.content)
                .offset(y:12)
            if showAuthorLink{
                CustomTitleView(titleText: "Author")
                
                NavigationLink {
                AuthorDetailView(authorSlug: quote.authorSlug)
            } label: {

                AuthorNameView(author: quote.author)
                
            }
                
            }
CustomTitleView(titleText: "Tags")
                .padding(.top,8)
            QuoteTagsView(tags: quote.tags)
        }
        .navigationBarTitle(Text("Quotes Details"))
    }
}

struct QuotesDetail_Previews: PreviewProvider {
    static var previews: some View {
        QuotesDetail(quote:Quote(tags: ["information"], _id:"", author: "Albert En", content: "Wisdom is a kind of knowledge. It is knowledge of the nature, career, and consequences of human values.", authorSlug: ""))
    }
}
