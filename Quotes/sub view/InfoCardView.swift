//
//  InfoCardView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct InfoCardView: View {
    @Environment(\.colorScheme) var colorScheme
    var title:String
    var image:Image
    var detailTitle:String = ""
    var body: some View {
        HStack {
            HStack{
                Text(title)
                    .font(.system(size: 20,weight: .bold,design: .default))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                    .lineLimit(1)
                Spacer()
                Text(detailTitle)
                    .font(.system(size: 20,weight: .bold,design: .default))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                    .foregroundColor(colorScheme == .dark ? .white : .black.opacity(0.5))
                image
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:20,height:20)
                    .padding(.trailing,15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        
    }
}

struct InfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCardView(title: "Wiki", image: Image(systemName: "link"))
            .previewLayout(.sizeThatFits)
    }
}
