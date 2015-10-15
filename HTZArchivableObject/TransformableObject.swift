//
//  TransformableObject.swift
//  TransformableSwiftObject
//
//  Created by Kemar White on 9/3/15.
//  Copyright © 2015 toohotz. All rights reserved.
//

import Foundation

/**
*  Protocol that defines a transformable object for purposes of transferring to a Watch App.
*/
public protocol TransformableObject: NSCoding {

    /// Key for the transformable object.
    var keyForObject: String {get set }
}

extension TransformableObject {

    /**
    Transforms a **TransformableObject** into a dictionary.

    - parameter object: The **TransformableObject** to transform.

    - returns: A dictionary with the transformable object and its corresponding key.
    */
    static public func transformObjectIntoDictionary(object: TransformableObject) -> [String : AnyObject]
    {
        return [object.keyForObject : NSKeyedArchiver.archivedDataWithRootObject(object)]
    }

    /**
    Transforms a dictionary into a **TransformableObject**.

    - parameter dictionary: The dictionary to transform.

    - returns: An optional **TransformableObject** object.
    */
    static public func transformDictionaryIntoObject<T: TransformableObject>(dictionary: [String : AnyObject]?) -> T?
    {
        return (dictionary?.isTransformableDictionary() == true) ? NSKeyedUnarchiver.unarchiveObjectWithData(dictionary![dictionary!.keys.first!] as! NSData!) as! T? : nil
    }
}

extension Dictionary {

    // Determines if the given dictionary is transformable.
    func isTransformableDictionary() -> Bool {
        return (self.isEmpty == false || self.keys.first != nil) ? true : false
    }
}
