//
//  DefaultView.swift
//  Quotes
//
//  Created by Dalveer singh on 26/06/22.
//

import SwiftUI

struct DefaultView: View {
    var title:String = "Nothing on List"
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.gray)
            .padding(.top,100)
        
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}
