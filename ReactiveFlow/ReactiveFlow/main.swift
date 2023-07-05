//
//  main.swift
//  Treino
//
//  Created by Moyses Miranda do Vale Azevedo on 02/07/23.
//

import Foundation
import Reatividade

let instanceApi = FakeApi()

func teste(_ value: [String]) {
    print(value)
}

DispatchQueue.global().async {
    instanceApi.mockApi { response in
        
    }
}

//RunLoop.main.run(until: .distantFuture)

