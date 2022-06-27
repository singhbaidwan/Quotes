//
//  QuotesCell.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct QuotesCell: View {
    var quoteText:String = ""
    var author:String = ""
    var authorVisible:Bool = true
    var isFavouriteQuote = false
    var body: some View {
        ZStack(alignment:.topTrailing){
            VStack(alignment: .leading){
                HStack{
                    let quoteContent = Text("\"")
                        .bold()
                    +
                    Text(quoteText)
                        .bold()
                       
                    +
                    Text("\"")
                        .bold()
                    quoteContent
                        .font(.title2)
                }
                .padding()
                HStack{
                    Spacer()
                    Text("- \(author)")
                        .italic()
                        .padding(.trailing,10)
                        
                }
            }
            Image(systemName: "star")
                .resizable()
                .frame(width: 20,height: 20)
                .opacity(isFavouriteQuote ? 1 : 0)
        }
        .background(Constants.appSecondary)
        .cornerRadius(10)
    }
}

struct QuotesCell_Previews: PreviewProvider {
    static var previews: some View {
        QuotesCell(quoteText: "Never give up in life", author: "albert Einstien", authorVisible: true, isFavouriteQuote: false).previewLayout(.sizeThatFits)
    }
}
