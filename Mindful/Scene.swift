//
//  Scene.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/4/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

/**
 * A class that manages the audio and video
 * files of the meditation scene
 */
class Scene: NSObject, NSCoding {
    
    let video: Asset
    let audio: Asset
    
    enum SceneKeys: String {
        case video = "video"
        case audio = "audio"
    }
    
    /**
     * Initialize the audio and video urls of the scene
     */
    init(withLocationVideo video: Asset, withMeditationTrack audio: Asset) {
        self.video = video
        self.audio = audio
    }
    
    // MARK: - NSCoding Protocol methods
    
    /**
     * initialize an object by decoding it
     */
    public required init(coder aDecoder: NSCoder) {
        video = aDecoder.decodeObject(forKey: SceneKeys.video.rawValue) as! Asset
        audio = aDecoder.decodeObject(forKey: SceneKeys.audio.rawValue) as! Asset
    }
    
    /**
     * encode the properties of the Scene
     */
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(video, forKey: SceneKeys.video.rawValue)
        aCoder.encode(audio, forKey: SceneKeys.audio.rawValue)
    }
}
