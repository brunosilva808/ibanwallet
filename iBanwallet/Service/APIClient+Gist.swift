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

typealias APISuccessArrayCallback<T> = ([T]) -> ()
typealias APIErrorCallback = (Error) -> ()

extension APIClient {
    
    static func getGists(successBlock: @escaping APISuccessArrayCallback<Gist>, errorBlock: @escaping APIErrorCallback) {
        
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
    
    static func getComics(onSuccess: @escaping APISuccessArrayCallback<Gist>, onError: @escaping APIErrorCallback) {
        
        URLSession.shared.dataTask(with: (APIRouter.gists.urlRequest?.url)!) { (data, response, error) in
            guard let data = data else { return }
            let comics = try? JSONDecoder().decode([Swifter].self, from: data)
            
//            switch comics?.code {
//            case 200:
//                onSuccess(gists!)
//                break
//            default:
//                onError()
//                break;
//            }
            
            }.resume()
    }
    
}
