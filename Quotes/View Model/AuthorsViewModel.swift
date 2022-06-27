//
//  AuthorsViewModel.swift
//  Quotes
//
//  Created by Dalveer singh on 27/06/22.
//

import Foundation
class AuthorsViewModel:ObservableObject{
    @Published var authorsModel:AuthorsModel?
    @Published var isLoading:Bool = true
    let authorWithSlugName = Constants.get_author_with_slugname
    func fetchAuthWithSlug(with slugName:String)
    {
        guard let url = URL(string: authorWithSlugName+slugName) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {return}
            do{
                let author = try JSONDecoder().decode(AuthorsModel.self, from: data)
                DispatchQueue.main.async {
                    self.authorsModel = author
                    self.isLoading = false
                }
            }
            catch{
                print("DEBUG : Failed to decode the author with slug name \(error)")
            }
        }.resume()
    }
}
