//
//  ExploreView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct ExploreView: View {
    private var gridItemLayout = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            Text("Explore Quotes with tags")
            LazyVGrid(columns: gridItemLayout,spacing: 10) {
                ForEach( 0 ... 10,id: \.self) { _ in
                    TagFilteredQuoteListView()
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
