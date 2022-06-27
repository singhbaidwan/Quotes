//
//  QuotesCardView.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct QuotesCardView: View {
    var text:String
    var body: some View {
        HStack{
            let quoteText =
            Text("\"")
            + Text(text)
            + Text("\"")
            quoteText
                .bold()
                .italic()
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            
            Spacer()
        }.background(Constants.appSecondary)
            .cornerRadius(5)
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        
    }
}

struct QuotesCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesCardView(text: "Wisdom is a kind of knowledge. It is knowledge of the nature, career, and consequences of human values.").previewLayout(.sizeThatFits)
    }
}
