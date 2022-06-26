//
//  AuthorNameView.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct AuthorNameView: View {
    @Environment(\.colorScheme) var colorScheme
    var author:String
    var body: some View {
        HStack{
            Text(author)
                .font(.system(size: 18))
                .italic()
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            Spacer()
            Image(systemName: "arrow.forward")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .frame(width: 20, height: 20)
                .padding(.trailing,15)
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

struct AuthorNameView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorNameView(author:"APJ abdul kalam")
    }
}
