//
//  FakeAPI.swift
//  Reatividade
//
//  Created by Moyses Miranda do Vale Azevedo on 02/07/23.
//

import Foundation

public class FakeApi {
    public init () {}

    public func mockApi(completion: @escaping ([String]?) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            let apiResponse: [String]? = ["Response Async"]
            completion(apiResponse)
        }
    }
}


