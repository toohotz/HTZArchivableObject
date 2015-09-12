//
//  TestObject.swift
//  HTZArchivableObject
//
//  Created by Kemar White on 9/8/15.
//  Copyright © 2015 toohotz. All rights reserved.
//

import Foundation

@objc (TestObject)

class TestObject: NSObject, TransformableObject {

    var keyForObject: String

    var name: String

    override init()
    {
        self.keyForObject = "swiftObject"
        self.name = ""
        super.init()
    }

    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(name, forKey: "name")
    }

    required init?(coder aDecoder: NSCoder) {
        self.keyForObject = "swiftObject"
        self.name = aDecoder.decodeObjectForKey("name") as! String
    }
}
