//
//  CreateActionView.swift
//  Quotes
//
//  Created by Dalveer singh on 01/07/22.
//

import SwiftUI


struct CreateActionView: View {
    @Binding var creatingStateActive: Bool
    @Binding var createViewScale: CGFloat
    @Binding var createViewOpacity: Double
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack{
            Image(systemName: "doc.plaintext")
                .resizable()
                .renderingMode(.template)
                .frame(width:25,height: 25)
                .foregroundColor(colorScheme == .dark ? .white : (creatingStateActive ? .white : .black))
                .opacity(createViewOpacity)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
//                .background(colorScheme == .dark ? (creatingStateActive ? Constants.appBlue : Constants.appSecondary) : (creatingStateActive ? Constants.appBlue : Constants.appSecondary))
                .cornerRadius(22.5)
                .scaleEffect(createViewScale)
            Spacer()
            
        }
        .padding(.leading,30)
    }
}

//struct CreateActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateActionView()
//    }
//}
