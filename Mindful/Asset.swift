//
//  Asset.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/8/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

/**
 * represents a media asset that can be loaded
 * into a Scene
 */
class Asset: NSObject, NSCoding {
    
    var url: URL
    var name: String
    
    enum AssetKeys: String {
        case name = "name"
        case url = "url"
    }
    
    /**
     * Initialize an Asset with a name and URL
     */
    init (name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    // MARK: - NSCoding Protocol methods
    
    /**
     * initialize an Asset by decoding it
     */
    public required init(coder aDecoder: NSCoder) {
        url = aDecoder.decodeObject(forKey: AssetKeys.url.rawValue) as! URL
        name = aDecoder.decodeObject(forKey: AssetKeys.name.rawValue) as! String
    }
    
    /**
     * encode the properties of the Asset
     */
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(url, forKey: AssetKeys.url.rawValue)
        aCoder.encode(name, forKey: AssetKeys.name.rawValue)
    }
    
}
