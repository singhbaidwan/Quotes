//
//  HomeView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach( 0 ... 10,id:\.self)
                {_ in 
                    QuotesCell()
                        .padding(.horizontal,5)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
