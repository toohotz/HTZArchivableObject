//
//  ViewController.swift
//  HTZArchivableObject
//
//  Created by Kemar White on 9/8/15.
//  Copyright © 2015 toohotz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupObject()
    }
    
    private func setupObject()
    {
        let obj = TestObject()
        obj.name = "Hello World"
        let someDict = TestObject.transformObjectIntoDictionary(obj)
        print("Our encoded object is \(someDict)", terminator: "\n")
        let decodedTestObject = TestObject.transformDictionaryIntoObject(someDict) as TestObject
        print("The object's name is \(decodedTestObject.name)", terminator: "\n")
    }
}

