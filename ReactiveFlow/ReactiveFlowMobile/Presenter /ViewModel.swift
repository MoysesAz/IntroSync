//
//  ViewModel.swift
//  RaidSync
//
//  Created by Moyses Miranda do Vale Azevedo on 04/07/23.
//

import Foundation
import Data

class ViewModel {

    var api: FakeApi = FakeApi()
    var isLoading: Observable<Bool> = Observable(false)
    var isApi: Observable<[String]> = Observable(nil)

    func getData() {
        if isLoading.value ?? true { // se for nil ou true
            return
        }

        isLoading.value = true

        api.mockApi { response in
            self.isApi.value = response
        }
    }
}
