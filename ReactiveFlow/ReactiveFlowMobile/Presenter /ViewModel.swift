//
//  ViewModel.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 04/07/23.
//

import Foundation
import Data

protocol ViewModelDelegate: AnyObject {
    func randomResponse() -> [String]
    func getDataInApi() 
}

class ViewModel: ViewModelDelegate {
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

    public func randomResponse() -> [String] {
        let responses = ["name: Flavia, age: 90",
                         "name: Carolina, age: 399",
                         "name: Karl, age: 1800",
                         "name: Andre, age: 100",
                         "name: Berb, age: 10",
                         "name: Afonse, age: 150"]
        let response = responses.randomElement()!
        return [response]
    }
}
