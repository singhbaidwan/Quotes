//
//  AuthorDetailView.swift
//  Quotes
//
//  Created by Dalveer singh on 27/06/22.
//

import SwiftUI

struct AuthorDetailView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false)
        {
            VStack{
                AuthorView()
                InfoCardView(title:"Author name",image: Image(systemName: "link"))
                InfoCardView(title:"Author Quotes",image: Image(systemName: "arrow.right"))
                
                Spacer()
            }
        }
        .navigationBarTitle(Text("Author Details"))
    }
}

struct AuthorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorDetailView()
    }
}
