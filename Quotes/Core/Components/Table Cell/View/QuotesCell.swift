//
//  QuotesCell.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct QuotesCell: View {
    var body: some View {
        ZStack(alignment:.topTrailing){
            VStack(alignment: .leading){
                HStack{
                    let quoteContent = Text("\"")
                        .bold()
                    +
                    Text("Never Give up in life")
                        .bold()
                    +
                    Text("\"")
                        .bold()
                    quoteContent

                }
                .padding()
                HStack{
                    Spacer()
                    Text("- Albert Einstien")
                        .italic()
                        
                }
            }
            Image(systemName: "star")
                .resizable()
                .frame(width: 30,height: 30)
        }
        .background(Color.gray.opacity(0.3))
        .cornerRadius(5)
    }
}

struct QuotesCell_Previews: PreviewProvider {
    static var previews: some View {
        QuotesCell().previewLayout(.sizeThatFits)
    }
}
