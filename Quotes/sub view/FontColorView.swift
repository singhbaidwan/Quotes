//
//  FontColorView.swift
//  Quotes
//
//  Created by Dalveer singh on 30/06/22.
//

import SwiftUI

struct FontColorView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var fontColor:Color
    @Binding var hideFontColorView: Bool
    @Binding var hideActionView: Bool
    let colors: [Color] = [
        Color.white,
        Color.black,
        Color.yellow,
        Color.red,
        Constants.appColor1,
        Constants.appColor2,
        Constants.appColor3,
        Constants.appColor4,
        Constants.appColor5,
        Constants.appColor6,
        Constants.appColor7,
        Constants.appColor8,
        Constants.appColor9
    ]
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(.horizontal,showsIndicators: false)
            {
                HStack(alignment:.center,spacing:10){
                    ForEach(colors,id:\.self)
                    {
                        color in
                        Button {
                            fontColor = color
                        } label: {
                            VStack{
                                color.frame(width:70,height:70)
                                    .cornerRadius(35)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 35)
                                            .stroke(.white,lineWidth: 2)
                                    )
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                                Rectangle()
                                    .fill(colorScheme == .dark ? (fontColor == color ? .white : .black ) : (fontColor == color ? .black : .white ))
                                    .frame(width: fontColor == color ? 10 : 5 , height: 5)
                                    .cornerRadius(2.5)
                                    .animation(.easeInOut)
                                
                            }
                            
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
//                .frame(height:300)
            }
            
            .frame(maxHeight:.infinity)
            Button {
                hideActionView = false
                hideFontColorView = true
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width:20,height:20)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Constants.appSecondary)
                    .cornerRadius(20)
            }
            .padding(.trailing,5)

        }
        .background(colorScheme == .dark ? .black : .white)
    }
}
//
//struct FontColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        FontColorView( fontColor: .black).previewLayout(.sizeThatFits)
//    }
//}
