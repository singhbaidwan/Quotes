//
//  TagsQuoteView.swift
//  Quotes
//
//  Created by Dalveer singh on 28/06/22.
//

import SwiftUI

struct TagsQuoteView: View {
    @ObservedObject var viewModel = QuotesViewModel()
    var tagName:String
    var quoteCount:Int
    init(tagName:String,quoteCount:Int){
        self.tagName = tagName
        self.quoteCount = quoteCount
        viewModel.fetchQuoteWithTagName(with: tagName, for: 1)
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            LazyVStack{
                if viewModel.isLoading {
                    ProgressView()
                        .padding(.trailing,100)
                        .progressViewStyle(.circular)
                }
                else{
                    if let quotes = viewModel.quoteModel?.results{
                        ForEach(quotes)
                        {
                            quote in
                            NavigationLink {
                                QuotesDetail(quote: quote)
                            } label: {
                                QuotesCell(quoteText: quote.content, author: quote.author, authorVisible: true, isFavouriteQuote: false)
                                    .padding([.leading,.trailing],10)
                            }

                        }
                        if let quoteTotalCount = viewModel.quoteModel?.totalCount{
                            if quoteTotalCount>quotes.count{
                                ProgressView()
                                    .padding()
                                    .progressViewStyle(.circular)
                                    .onAppear {
                                        if let page = viewModel.quoteModel?.page{
                                            self.viewModel.fetchQuoteWithTagName(with: self.tagName, for: page+1)
                                        }
                                    }
                            }
                            
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack(alignment:.center,spacing: 0)
                {
                    Text(tagName.uppercased())
                        .font(.system(size: 16, weight: .bold, design: .default))
                    Text("\(quoteCount)")
                        .font(.caption)
                }
            }
        }
    
    }

}

struct TagsQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        TagsQuoteView(tagName: "Technology", quoteCount: 16)
    }
}
