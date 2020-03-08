//
//  Task.swift
//  Our Plan
//
//  Created by Bryan Lopez on 3/5/20.
//  Copyright © 2020 Lopez Bryan. All rights reserved.
//

import Foundation

struct Task{
    var name:String
    var done: Bool
    var id: String
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "done": done
        ]
    }
}

extension Task{
    init?(dictionary: [String : Any], id: String) {
        guard   let name = dictionary["name"] as? String,
            let done = dictionary["done"] as? Bool
            else { return nil }
        
        self.init(name: name, done: done, id: id)
    }
}
