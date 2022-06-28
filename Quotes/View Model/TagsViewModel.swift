//
//  TagsViewModel.swift
//  Quotes
//
//  Created by Dalveer singh on 28/06/22.
//

import Foundation
class TagsViewModel:ObservableObject{
    let url = Constants.get_tags_url
    @Published var isLoading = true
    @Published var tagsModel:[TagsModel]?
    func fetchTags(){
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else{return}
            do{
                let tags = try JSONDecoder().decode([TagsModel].self, from: data)
                DispatchQueue.main.async {
                    print("This is tags")
                    print(tags)
                    self.isLoading = false
                    self.tagsModel = tags
                }
            }
            catch{
                print("DEBUG : Error in fetching the data \(error)")
            }
        }.resume()
    }
}
