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
                    self.quoteModel = quote
                    self.isLoading = false
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
                    self.quoteModel = quote
                    self.isLoading = false
                }
            }
            catch{
            print("DEBUG: fetch quotes with author slug failed")
            }
        }.resume()
    }
}
