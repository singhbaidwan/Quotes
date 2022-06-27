//
//  AuthorDetailView.swift
//  Quotes
//
//  Created by Dalveer singh on 27/06/22.
//

import SwiftUI

struct AuthorDetailView: View {
    var authorSlug:String
    @ObservedObject var viewModel = AuthorsViewModel()
    init(authorSlug:String)
    {
        self.authorSlug = authorSlug
        viewModel.fetchAuthWithSlug(with: authorSlug)
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            VStack{
                if viewModel.isLoading {
                    ProgressView()
                        .padding(.top,100)
                        .progressViewStyle(.circular)
                }
                else{
                    if let authorData = viewModel.authorsModel?.results {
                        AuthorView(author: authorData[0])
                        Link(destination: URL(string: authorData[0].link)!) {
                            InfoCardView(title:"\(authorData[0].name) Wiki",image: Image(systemName: "link"))
                        }
                        NavigationLink {
                            AuthorQuoteListView(authorSlug: authorSlug, authorName: authorData[0].name)
                        } label: {
                            
                            InfoCardView(title:"\(authorData[0].name) Quotes",image: Image(systemName: "arrow.right"))
                            
                        }

                        Spacer()
                    }
                }
            }
        }
        .navigationBarTitle(Text("Author Details"))
    }
}

struct AuthorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        AuthorDetailView(authorSlug: "")
    }
}
