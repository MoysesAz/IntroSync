//
//  ViewModel.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 04/07/23.
//

import Foundation
import Data

protocol HomeViewModelDelegate: AnyObject {
    func responseSync() -> [String]
    func getDataInApi() 
}

class HomeViewModel: HomeViewModelDelegate {
    var api: FakeApi = FakeApi()
    var isLoading: Observable<Bool> = Observable(false)
    var isApi: Observable<[String]> = Observable(nil)

    func getDataInApi() {
        if isLoading.value ?? true { // se for nil ou true
            return
        }
        isLoading.value = true
        api.mockApi { response in
            self.isApi.value = response
            self.isLoading.value = false
        }
    }

    public func responseSync() -> [String] {
        return ["Response Sync"]
    }
}
