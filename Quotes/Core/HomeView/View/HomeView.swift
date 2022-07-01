//
//  HomeView.swift
//  Quotes
//
//  Created by Dalveer singh on 24/06/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var quotesVM = QuotesViewModel()
    
    @State var isCreatingQuote:String = ""
    @State var cardOffset:CGSize  = .zero
    @State var createViewScale:CGFloat = 0.0
    @State var createViewOpacity:Double = 0.0
    @State var creatingStateActive : Bool = false
    @State var showingCreatorView:Bool  = false
    @State var quoteToSend:String = ""
    @State var quoteToSendAuthor:String = ""
    
    init(){
        quotesVM.fetchQuote(for: 1)
    }
    var body: some View {
        ScrollView{
            LazyVStack{
                if quotesVM.isLoading{
                    ProgressView()
                        .padding(.top,100)
                        .progressViewStyle(.circular)
                }
                else{
                    if let quotes = quotesVM.quoteModel?.results{
                        ForEach(quotes){
                            quote in
                            ZStack{
                                if isCreatingQuote == quote._id {
                                    CreateActionView(creatingStateActive: $creatingStateActive, createViewScale: $createViewScale, createViewOpacity: $createViewOpacity)
                                }
                                
                                NavigationLink {
                                    QuotesDetail(quote: quote)
                                } label: {
                                    QuotesCell(quoteText: quote.content, author: quote.author, authorVisible: true, isFavouriteQuote: false)
                                        .padding([.leading,.trailing],10)
                                        .offset(CGSize(width: isCreatingQuote == quote._id ? cardOffset.width : .zero, height: .zero))
                                        .gesture(
                                        DragGesture()
                                            .onChanged{ gesture in
                                                if cardOffset.width>=0 && cardOffset.width < 100 {
                                                    isCreatingQuote = quote._id
                                                    cardOffset = gesture.translation
                                                    createViewOpacity = 1
                                                    createViewScale = (cardOffset.width/100) > 1 ? 1 :
                                                    (cardOffset.width / 100)
                                                    if cardOffset.width >= 95{
                                                        creatingStateActive = true
                                                    }
                                                    else{
                                                        creatingStateActive = false
                                                    }
                                                }
                                            }
                                            .onEnded{ _ in
                                                withAnimation(Animation.spring()){
                                                    if cardOffset.width > 95{
                                                        quoteToSend = quote.content
                                                        quoteToSendAuthor = quote.author
                                                        showingCreatorView.toggle()
                                                    }
                                                    cardOffset = .zero
                                                    isCreatingQuote = ""
                                                    createViewOpacity = 0
                                                    createViewScale = 0
                                                    creatingStateActive = false
                                                }
                                            }
                                        )
                                }
                            }
                        }
                        if let quoteTotalCount = quotesVM.quoteModel?.totalCount{
                            ProgressView()
                                .padding()
                                .progressViewStyle(.circular)
                                .onAppear {
                                    if let page = quotesVM.quoteModel?.page{
                                        self.quotesVM.fetchQuote(for: page+1)
                                    }
                                }
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showingCreatorView) {
            CreatorsView(quoteContent: quoteToSend,quoteAuthor: quoteToSendAuthor)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
