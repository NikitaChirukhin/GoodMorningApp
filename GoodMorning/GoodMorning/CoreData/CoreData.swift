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
    func getItems() throws -> [MOClothesItem]
}

final class CoreData {
    var objects: [NSManagedObject] = []
}

extension CoreData: CoreDataProtocol {
    
    func save(object: MOClothesItemModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "MOClothesItem", in: managedContext)!
//        let item = NSManagedObject(entity: entity, insertInto: managedContext)
//        item.setValue(object, forKeyPath: "name")

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
    
    func getItems() throws -> [MOClothesItem] {
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
    
    func deleteItem(_ name: String) {
        
    }
}
