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
    
//    static func getGistDec(successBlock: @escaping APISuccessArrayCallback<GistDec>, errorBlock: @escaping APIErrorCallback) {
//        
//        Alamofire.request(APIRouter.gists).validate().responseJSON { (response) in
//            switch response.result {
//            case .success:
//                
//                guard let jsonData = response.data else {
//                    errorBlock(response.error)
//                    return
//                }
//                
//                do{
//                    let array = try JSONDecoder().decode([GistDec].self, from: jsonData)
//                    successBlock(array)
//                } catch {
//                    errorBlock(error)
//                }
//            case .failure(let error):
//                errorBlock(error)
//            }
//        }
//
//    }

    func getGists(successBlock: @escaping APISuccessArrayCallback<Gist>, errorBlock: @escaping APIErrorCallback) {
        
//        Alamofire.request(APIRouter.gists).responseJSON { (response) in
//            switch response.result {
//            case .success:
//
//                    let jsonData = response.data
//                    do{
//                        let allReplies = try JSONDecoder().decode([GistDec].self, from: jsonData!)
//                        print(allReplies)
//                    }catch {
//                        print("Error: \(error)")
//                    }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        Alamofire.request(APIRouter.gists).validate().responseArray { [weak self] (response: DataResponse<[Gist]>) in
            switch response.result {
            case .failure(let error):
                errorBlock(error)
                break
            case .success(let value):
                self?.realmManager.save(array: value)
                successBlock(value)
            }
        }
        
    }

    
//    static func getGists(successBlock: @escaping APISuccessArrayCallback<Gist>, errorBlock: @escaping APIErrorCallback) {
//
//        Alamofire.request(APIRouter.gists).validate().responseArray { (response: DataResponse<[Gist]>) in
//            switch response.result {
//            case .failure(let error):
//                errorBlock(error)
//                break
//            case .success(let value):
//                successBlock(value)
//            }
//        }
//
//    }
    
}
