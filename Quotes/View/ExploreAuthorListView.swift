//
//  ExploreAuthorListView.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct ExploreAuthorListView: View {
    @ObservedObject var viewModel = AuthorsViewModel()
    init()
    {
        viewModel.fetchAuthor(with: 1)
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            LazyVStack{
                if viewModel.isLoading{
                    ProgressView()
                        .padding(.top,100)
                        .progressViewStyle(.circular)
                }
                else{
                    if let authors = viewModel.authorsModel?.results{
                ForEach(authors){
                    author in
                    NavigationLink {
                        AuthorDetailView(authorSlug: author.slug)
                    } label: {
                        ExploreAuthorCardView(authorSlug: author.slug, authorName: author.name, authorDescription: author.description, quoteCount: author.quoteCount)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    }
                }
                        if let authorTotalCount = viewModel.authorsModel?.totalCount{
                            if authorTotalCount>authors.count{
                                ProgressView()
                                    .padding()
                                    .progressViewStyle(.circular)
                                    .onAppear {
                                        if let page = viewModel.authorsModel?.page{
                                            self.viewModel.fetchAuthor(with: page+1)
                                        }
                                    }
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct ExploreAuthorListView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreAuthorListView()
    }
}
