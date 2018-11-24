//
//  APIClient.swift
//  iBanWallet
//
//  Created by Bruno Silva on 13/04/2018.
//  Copyright © 2018 Bruno Silva. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import RealmSwift

typealias APISuccessArrayCallback<T> = ([T]) -> ()
typealias APIErrorCallback = (Error) -> ()

extension APIClient {

    func getGists(successBlock: @escaping APISuccessArrayCallback<RealmGist>, errorBlock: @escaping APIErrorCallback) {
        
        Alamofire.request(APIRouter.gists).validate().responseArray { [weak self] (response: DataResponse<[RealmGist]>) in
            switch response.result {
            case .failure(let error):
                errorBlock(error)
                break
            case .success(let value):
                self?.realmManager.save(array: value)
                print(value.first?.owner?.toJSON())
                successBlock(value)
            }
        }
   
    }
    
}
