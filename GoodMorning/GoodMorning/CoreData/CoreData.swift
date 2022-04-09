//
//  CoreData.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 09.04.2022.
//

import CoreData
import UIKit

protocol CoreDataProtocol {
    func save(object: ClothesItem)
    func getItems()
}

final class CoreData {
    var objects: [NSManagedObject] = []
}

extension CoreData: CoreDataProtocol {
    
    func save(object: ClothesItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MOClothesItem", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(object, forKey: "name")
        
        do {
            try managedContext.save()
            objects.append(item)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getItems() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MOClothesItem")
        do {
            objects = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
