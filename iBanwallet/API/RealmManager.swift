//
//  RealmManager.swift
//  iBanwallet
//
//  Created by Bruno Silva on 22/11/2018.
//

import Foundation
import RealmSwift

struct RealmManager {
    
    let realm = try! Realm()
    
    func save<T: Object>(array: [T]) {
        try! realm.write {
            realm.add(array)
        }
    }
    
}
