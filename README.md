# HTZTransformableObject

While working on a Watch App for WatchOS 2, I noticed the need to archive and unarchive my custom class objects that I would be sending from the WatchKit Extension to the iPhone app and vice versa.  Realizing that and the restrictions in the types that are allowed to be sent across devices, I created this project to help streamline the process of sending custom class objects between the Watch App and iOS App.

Here I created an archivable NSData object, protocol of NSCoding to make sending objects across to a Watch App Extension for example easier.  Only certain types as we know are currently transferable between the iPhone app and Watch Extension being 

- NSData
- NSString
- NSNumber
- NSDate
- NSArray
- NSDictionary

So behind the scenes, **NSKeyedArchiver** and **NSKeyedUnarchiver** to encode and decode the desired object class of ours.  
A single variable being the key for the archived object is the single requirement to conform to the TransformableObject protocol. This key is used when the dictionary is created to allow a single line archiving and unarchiving of the custom object.

Knowing how the protocol and its extension works, the last bit is for our custom object’s structure setup.

Since our object structure is deriving from NSCoding, each property on our custom class will have to to use the required ``` func encodeWithCoder(aCoder: NSCoder)``` method to encode the objects with its corresponding key and to decode the object using ```required init?(coder aDecoder: NSCoder)``` as well. After this boilerplate setup for our object, we can then freely use encode and decode our object across the WatchKit Extension and the parent iOS application.

Conform to the protocol, set your ```keyForObject``` property (key used can be whatever you choose as this isn’t so critical), and if you’re utilizing Swift for your object class, be sure to use ```@obj(ClassName)``` to resolve namespace issues with Swift and Objective-C.

##Examples

Here are two snippets from a project that I am currently using this implementation where first, an API call is made to retrieve some list of service centers that is of a custom type ```Dealership``` where each service center is transformed into a dictionary and sent off to the Watch App.

![](http://f.cl.ly/items/3V3H3N2L1k1X032M1G2j/Screen%20Shot%202015-09-08%20at%209.03.37%20AM.png)


On the WatchApp side, here go through the list of dictionaries received, transforming them back into our ```Dealership``` custom object type and using it within our WatchKit Extension.

![](http://f.cl.ly/items/1J013o160Y090q3U1j0J/Screen%20Shot%202015-09-08%20at%209.03.01%20AM.png)
##Requirements

Minimum iOS Target: iOS 9

Minimum watchOS Target: watchOS 2.0
Minimum Xcode Version: Xcode 7

##Installation

Simply drag and drop `TransformableObject` from the project into your project and conform away.

##LICENSE

Distributed under the MIT License.

##Contributions

Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub.


##Author

Feel free to contact me at toohotz@me.com
