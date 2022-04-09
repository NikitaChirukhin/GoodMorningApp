//
//  CoreData.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 09.04.2022.
//

import CoreData
import UIKit

final class CoreData {
    private var objects: [NSManagedObject] = []
}

extension CoreData {
    
    func save(object: ClothesItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MO", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(object, forKey: "")
    }
}
