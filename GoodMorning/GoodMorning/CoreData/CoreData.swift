//
//  CoreData.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 09.04.2022.
//

import CoreData
import UIKit

protocol CoreDataProtocol {
    func save(object: MOClothesItemModel)
    func deleteItem(item: MOClothesItemModel)
    func getItems() throws -> [ClothesItem]
}

final class CoreData {
    var objects: [NSManagedObject] = []
}

extension CoreData: CoreDataProtocol {
    
    func save(object: MOClothesItemModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        let item = MOClothesItem(context: managedContext)
        item.name = object.name
        item.temperature = object.temperature
        item.color = object.color
        item.type = object.type
        item.picture = object.picture
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getItems() throws -> [ClothesItem] {
        var data: [ClothesItem] = []
        do {
            try fetchItem().forEach({ data.append(ClothesItem(with: $0)) })
        } catch let error as NSError {
            print(error)
        }
        return data
    }
    
    func deleteItem(item object: MOClothesItemModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let deleteItem = MOClothesItem(context: managedContext)
        deleteItem.name = object.name
        deleteItem.temperature = object.temperature
        deleteItem.color = object.color
        deleteItem.type = object.type
        deleteItem.picture = object.picture
        
        managedContext.delete(deleteItem)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

//MARK: - CoreData private methods
private extension CoreData {
    func fetchItem() throws -> [MOClothesItem] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw NetworkError.serverError }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MOClothesItem")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let items = try managedContext.fetch(fetchRequest) as! [MOClothesItem]
            return items
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            throw error
        }
    }
}
