//
//  WSManager+Payment.swift
//  Move Me
//
//  Created by Bruno Silva on 13/04/2018.
//  Copyright © 2018 Bruno Silva. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

typealias ResponseArrayCallback<T> = ([T]) -> ()
typealias ResponseErrorCallback = (Error) -> ()

extension APIClient {
    
    static func getGists(successBlock: @escaping ResponseArrayCallback<Gist>, errorBlock: @escaping ResponseErrorCallback) {
        
        Alamofire.request(APIRouter.gists).validate().responseArray { (response: DataResponse<[Gist]>) in
            switch response.result {
            case .failure(let error):
                errorBlock(error)
                break
            case .success(let value):
                successBlock(value)
            }
        }
    }
}
