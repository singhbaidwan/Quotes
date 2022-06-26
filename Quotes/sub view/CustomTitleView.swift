//
//  CustomTitleView.swift
//  Quotes
//
//  Created by Dalveer singh on 25/06/22.
//

import SwiftUI

struct CustomTitleView: View {
    var titleText:String
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack {
            Text(titleText)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black.opacity(0.8))
                .font(.footnote)
            .bold()
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 30, bottom: 5, trailing: 20))
        
    }
    
}

struct CustomTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitleView(titleText: "Author")
    }
}
