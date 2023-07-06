//
//  APIService.swift
//  TechmentAssignment
//
//  Created by NayomeDevapriyaAnga on 03/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//

import Foundation

class APIService: NSObject {
    
    private let sourceURL = "https://api.github.com/search/repositories?q=language:"
    
    func fetchProgrammingLanguages(withKeyword:String, completion:@escaping ( [ItemDetail]) ->() ) {
        let newURL = URL(string: "https://api.github.com/search/repositories?q=language:" + withKeyword.lowercased())!
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)

        session.dataTask(with: newURL) { (data,response,error) in
            guard error == nil else {
                completion([])
                return
            }
            guard let data = data else {
                completion([])
                return
            }
            do {
                let repoData = try JSONDecoder().decode(ProgLanguages.self, from: data)
                completion(repoData.items)
            } catch let error {
                print(error)
                completion([])
            }
        }.resume()
    }
    
    
}
