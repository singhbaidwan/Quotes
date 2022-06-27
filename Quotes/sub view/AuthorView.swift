//
//  AuthorView.swift
//  Quotes
//
//  Created by Dalveer singh on 27/06/22.
//

import SwiftUI

struct AuthorView: View {
    var author:Author
    var body: some View {
        VStack(alignment:.leading)
        {
            HStack{
                VStack(alignment:.leading,spacing: 10)
                {
                    Text(author.name)
                        .font(.title)
                        .bold()
                    Text(author.description)
                        .font(.caption)
                        .italic()
                    Text(author.bio)
                        .font(.body)
                
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        }
        .background(Constants.appSecondary)
        .cornerRadius(10)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView(author: Author(link: "", bio: "This is the body of the text he is bla bla bla lkajdlfj lkajfdklajkd lkjadkfj alkjdfklajf ljalkdfjl lkjaflksjf ajdlfk;aldf ;akdf ajdflkj jaldjfl ajdflkjakldf j ", description: "Americal Bussinessman", _id: "", name: "", quoteCount: 12, slug: "")).previewLayout(.sizeThatFits)
    }
}
