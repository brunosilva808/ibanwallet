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

typealias APIArrayCallback<T> = ([T]) -> ()

extension APIClient {

    func getGists(completion: @escaping APIArrayCallback<RealmGist>) {
        
        Alamofire.request(APIRouter.gists).validate().responseArray { [weak self] (response: DataResponse<[RealmGist]>) in
            switch response.result {
            case .failure(_):
                completion(self?.realmManager.get(object: RealmGist.self) ?? [])
                break
            case .success(let value):
//                print(value)
                self?.realmManager.save(array: value)
                completion(value)
            }
        }
   
    }
    
}
