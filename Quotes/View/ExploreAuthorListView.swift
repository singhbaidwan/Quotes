//
//  ExploreAuthorListView.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct ExploreAuthorListView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...10,id:\.self){
                    _ in
                    ExploreAuthorCardView(authorName: "Albert Einstien", authorDescription: "This is a author description", quoteCount: 1244)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
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
