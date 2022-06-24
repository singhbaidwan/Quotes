//
//  CustomTabView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selection = 0
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView()
                    .navigationTitle(Text("Quotes"))
                    .navigationBarTitleDisplayMode(.inline)
            }.tabItem {
                
                Image(systemName: "house")
                    .renderingMode(.template)
                    
                
            }
            .tag(0)
            NavigationView {
                ExploreView()
                    .navigationTitle(Text("Explore"))
                    .navigationBarTitleDisplayMode(.inline)
            }.tabItem {
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                 
            }.tag(1)
            NavigationView {
                FavouriteView()
                    .navigationTitle(Text("Favourite"))
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "star")
                    .renderingMode(.template)
            }.tag(2)
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
