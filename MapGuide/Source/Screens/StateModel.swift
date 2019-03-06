//
//  StateModel.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 3/6/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import RealmSwift

class StateModel: Object {
    
    @objc dynamic var id = Int()
    @objc dynamic var name = String()
    @objc dynamic var latitude = Double()
    @objc dynamic var longitute = Double()
    
    
    var categories = List<Category>()
    
    //устанавливаем PK
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //статический метод для быстрой инициализации
    static func getStateObject(id: Int, name: String, latitude: Double, longitute: Double, categories: [Category]) -> StateModel {
        
        let stateModel = StateModel()
        stateModel.id = id
        stateModel.name = name
        stateModel.latitude = latitude
        stateModel.longitute = longitute
        
        for category in categories {
            stateModel.categories.append(category)
        }
        return stateModel
    }
    
}

class Category: Object {

    @objc dynamic var id = Int()
    @objc dynamic var name = String()
    @objc dynamic var iconImage = String()
    
    //устанавливаем PK    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //статический метод для быстрой инициализации
    static func getCategoryObject(id: Int, name: String, iconImage: String) -> Category {
        let category = Category()
        
        category.id = id
        category.name = name
        category.iconImage = iconImage
        
        return category
    }
}
