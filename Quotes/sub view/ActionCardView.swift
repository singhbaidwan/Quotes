//
//  ActionCardView.swift
//  Quotes
//
//  Created by Dalveer singh on 30/06/22.
//

import SwiftUI

struct ActionCardView: View {
    @Environment(\.colorScheme) var colorScheme
    var data : ActionViewData
    var body: some View {
        VStack(alignment:.center,spacing: 7)
        {
            ZStack{
                if data.type == "image"
                {
                    Image(uiImage: (data.image ?? UIImage(named: "logo"))!)
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.white , lineWidth: 2)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                if data.type == "color"
                {
                    data.color
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.white , lineWidth: 2)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                if data.type == "text"
                {
                    Text(data.text)
                        .font(.custom(Constants.fontItalic, size: 23))
                        .frame(width: 70, height: 70)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(Constants.appSecondary)
                        .multilineTextAlignment(.center)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.white , lineWidth: 2)
                        )
                }
            }
            Text(data.title)
                .font(.custom(Constants.fontPoppinsRegular, size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
}

struct ActionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActionCardView(data: ActionViewData(type: "text", image: nil, text: "hi", color: nil , title: "", toggleView: ""))
    }
}
