//
//  HomeViewModel.swift
//  TechmentAssignment
//
//  Created by NayomeDevapriyaAnga on 03/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//

import Foundation

class HomeViewModel: NSObject {
    var searchString: String = ""
    private var apiService: APIService!
    
    private (set) var apiData: [ItemDetail]? {
        didSet {
            self.bindProgViewModelToController()
        }
    }
    
    var bindProgViewModelToController : (() -> ()) = {}
    var updateLoadingStatus: (()->())?

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    
    
    
    func callFuncToFetchProgLangList(withText: String){
        self.isLoading = true
        self.apiService.fetchProgrammingLanguages(withKeyword: withText,completion: { ( itemsList) in
            print(itemsList)
            self.apiData = itemsList
            self.isLoading = false

        })
    }
}
