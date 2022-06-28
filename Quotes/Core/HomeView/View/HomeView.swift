//
//  HomeView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var quotesVM = QuotesViewModel()
    init(){
        quotesVM.fetchQuote(for: 1)
    }
    var body: some View {
        ScrollView{
            LazyVStack{
                if quotesVM.isLoading{
                    ProgressView()
                        .padding(.top,100)
                        .progressViewStyle(.circular)
                }
                else{
                    if let quotes = quotesVM.quoteModel?.results{
                        ForEach(quotes){
                            quote in
                            NavigationLink {
                                QuotesDetail(quote: quote)
                            } label: {
                                QuotesCell(quoteText: quote.content, author: quote.author, authorVisible: true, isFavouriteQuote: false)
                                    .padding([.leading,.trailing],10)
                            }
                        }
                        if let quoteTotalCount = quotesVM.quoteModel?.totalCount{
                            ProgressView()
                                .padding()
                                .progressViewStyle(.circular)
                                .onAppear {
                                    if let page = quotesVM.quoteModel?.page{
                                        self.quotesVM.fetchQuote(for: page+1)
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
