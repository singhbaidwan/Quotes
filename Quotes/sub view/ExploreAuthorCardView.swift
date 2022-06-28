//
//  ExploreAuthorCardView.swift
//  Quotes
//
//  Created by Dalveer singh on 26/06/22.
//

import SwiftUI

struct ExploreAuthorCardView: View {
    @Environment(\.colorScheme) var colorScheme
    var authorSlug:String
    var authorName:String
    var authorDescription:String
    var quoteCount:Int
    var body: some View {
        HStack{
            VStack(alignment:.leading)
            {
                Text(authorName)
                    .font(.title2)
                    .bold()
                Text(authorDescription)
                    .font(.title3)
                    .italic()
                Text("Quote count \(quoteCount)")
                    .font(.system(.caption))
                    .foregroundColor(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5))
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            Spacer()
            Image(systemName: "arrow.forward")
                .resizable()
                .renderingMode(.template)
                .frame(width:20,height:20)
                .padding(.trailing,15)
                .foregroundColor(colorScheme == .dark ? .white:.black)
            
        }
        .background(Constants.appSecondary)
        .cornerRadius(10)
    }
}

struct ExploreAuthorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreAuthorCardView(authorSlug: "", authorName: "Albert Einstien", authorDescription: "This is a author description", quoteCount: 1244)
            .previewLayout(.sizeThatFits)
    }
}
