//
//  QuotesViewModel.swift
//  Quotes
//
//  Created by Dalveer singh on 26/06/22.
//

import Foundation
class QuotesViewModel:ObservableObject{
    @Published var quoteModel:QuotesModel?
    @Published var isLoading:Bool = true
    func fetchQuote(for page:Int)
    {
        guard let url = URL(string: Constants.get_quote_url+"\(page)") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do{
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    if page == 1{
                        self.quoteModel = quote
                        self.isLoading = false
                    }
                    else{
                        self.isLoading = false
                        self.quoteModel?.results.append(contentsOf: quote.results)
                        self.quoteModel?.page = quote.page
                    }
                }
            }
            catch{
                print("Decoding Failed")
            }
        }.resume()
    }
    func fetchQuoteWithAuthorSlug(with slugname:String,for page:Int){
        guard let url = URL(string: Constants.get_quotes_for_author + slugname + "&page=\(page)") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else{return }
            do{
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    if page == 1{
                        self.quoteModel = quote
                    }
                    else{
                        self.quoteModel?.page = quote.page
                        self.quoteModel?.results.append(contentsOf: quote.results)
                    }
                }
            }
            catch{
            print("DEBUG: fetch quotes with author slug failed")
            }
        }.resume()
    }
    func fetchQuoteWithTagName(with tagName:String,for page:Int){
        guard let url = URL(string: Constants.get_quotes+"?tags=\(tagName)&page=\(page)") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            do{
                guard let data = data else {return}
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    if page == 1{
                    self.isLoading = false
                    self.quoteModel = quote
                    }
                    else{
                        self.isLoading = false
                        self.quoteModel?.page = quote.page
                        self.quoteModel?.results.append(contentsOf: quote.results)
                    }
                }
            }
            catch{
                print("DEBUG : Fetch quotes with tag Name \(error)")
            }
        }.resume()
    }
}
