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
class Asset {
    
    var url: URL
    var name: String
    
    init (name: String, url: URL) {
        self.name = name
        self.url = url
    }
}
