//
//  FontView.swift
//  Quotes
//
//  Created by Dalveer singh on 30/06/22.
//

import SwiftUI

struct FontView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var fontName: String
    @Binding var hideFontView: Bool
    @Binding var hideActionView: Bool
    let fontsArr = [Constants.fontRegular , Constants.fontGaramondRoman , Constants.fontFreightSansBook , Constants.fontVollkornItalic , Constants.fontGothamLight , Constants.fontMontserratRegular , Constants.fontDancingScriptRegular, Constants.fontOpenSansRegular, Constants.fontTimesNewRoman , Constants.fontPoppinsRegular , Constants.fontNunitoRegular]
    var body: some View {
        ZStack(alignment:.topTrailing)
        {
            ScrollView(.horizontal,showsIndicators: false)
            {
                HStack(alignment: .center,spacing: 10) {
                    ForEach(fontsArr,id:\.self)
                    {
                        font in
                        VStack{
                            
                            Button {
                                fontName = font
                            } label: {
                                Text("Ag")
                                    .font(.custom(font,size: 23))
                                    .frame(width:70,height: 70)
                                    .background(Constants.appSecondary)
                                    .multilineTextAlignment(.center)
                                    .cornerRadius(35)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .overlay(RoundedRectangle(cornerRadius: 35)
                                        .stroke(Color.white,lineWidth: 2)
                                    )
                            }

                            Rectangle()
                                .fill(colorScheme == .dark ? (fontName == font ? .white : .black ) : (fontName == font ? .black : .white ))
                                    .frame(width: fontName == font ? 10 : 5,height: 5)
                                    .cornerRadius(2.5)
                                    .animation(.easeInOut)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                .frame(height:100)
                
            }
            .frame(maxHeight:.infinity)
            Button {
                hideActionView = false
                hideFontView = true
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
        .frame(maxWidth:.infinity)
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

//struct FontView_Previews: PreviewProvider {
//    static var previews: some View {
//        FontView(fontName: Constants.fontRegular).previewLayout(.sizeThatFits)
//    }
//}
