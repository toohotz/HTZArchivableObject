//
//  NSObjectArchivableObject.swift
//  ArchivableSwiftObject
//
//  Created by Kemar White on 9/3/15.
//  Copyright © 2015 toohotz. All rights reserved.
//

import Foundation

/**
*  Protocol that defines an archivable object for purposes of transferring to a Watch App.
*/
public protocol ArchivableObject: NSCoding {

    /// Key for the archiveable object.
    var keyForObject: String {get set }
}

extension ArchivableObject {

    /**
    Transforms an **ArchivableObject** into a dictionary.

    - parameter object: The **ArchivableObject** to transform.

    - returns: A dictionary with the archived object and its corresponding key.
    */
    static public func transformArchivableObjectForDictionary(object: ArchivableObject) -> [String : AnyObject]
    {
        return [object.keyForObject : NSKeyedArchiver.archivedDataWithRootObject(object)]
    }

    /**
    Transforms a dictionary into an **ArchivableObject**.

    - parameter dictionary: The dictionary to transform.

    - returns: An object of type **ArchivableObject**.
    */
    static public func transformDictionaryForArchivableObject<T: ArchivableObject>(dictionary: [String : AnyObject]) -> T
    {
        return NSKeyedUnarchiver.unarchiveObjectWithData(dictionary[dictionary.keys.first!] as! NSData!) as! T
    }
}
