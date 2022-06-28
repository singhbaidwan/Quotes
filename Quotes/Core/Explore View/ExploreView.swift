//
//  ExploreView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = TagsViewModel()
    private var gridItemLayout = [GridItem(.flexible()),GridItem(.flexible())]
    init(){
        viewModel.fetchTags()
    }
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            if viewModel.isLoading{
                ProgressView()
                    .padding(.top,100)
                    .progressViewStyle(.circular)
            }
            else{
                VStack(alignment:.leading){
                    NavigationLink(destination: ExploreAuthorListView()) {
                        InfoCardView(title: "Explore Authors", image: Image(systemName: "arrow.forward"))
                    }
                    CustomTitleView(titleText: "Explore Quotes with tags")
                    if let data = viewModel.tagsModel{
                        LazyVGrid(columns: gridItemLayout,spacing: 5) {
                            ForEach(data) { tag in
                                NavigationLink {
                                    TagsQuoteView(tagName: tag.name, quoteCount: tag.quoteCount)
                                } label: {
                                    TagFilteredQuoteListView(tagName: tag.name, quoteCount: tag.quoteCount)
                                }

                            }
                        }
                    }
                    
                }
                
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
