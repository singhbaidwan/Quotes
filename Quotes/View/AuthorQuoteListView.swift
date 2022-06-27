//
//  AuthorQuoteListView.swift
//  Quotes
//
//  Created by Dalveer singh on 28/06/22.
//

import SwiftUI

struct AuthorQuoteListView: View {
    @ObservedObject var viewModel = QuotesViewModel()
    var authorSlug:String
    var authorName:String
    init(authorSlug:String,authorName:String)
    {
        self.authorSlug = authorSlug
        self.authorName = authorName
        viewModel.fetchQuoteWithAuthorSlug(with: self.authorSlug, for: 1)
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            if viewModel.isLoading {
                ProgressView().padding(.top,100).progressViewStyle(.circular)
            }
            else{
                if let quotes = viewModel.quoteModel?.results{
                    LazyVStack{
                        ForEach(quotes)
                        {
                            quote in
                            QuotesCardView(text: quote.content)
                        }
                    }
                }
            }
        }
    }
}

struct AuthorQuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorQuoteListView(authorSlug: "", authorName: "")
    }
}
