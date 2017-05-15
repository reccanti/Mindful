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
class Scene {
    
    let video: Asset
    let audio: Asset
    
    /**
     * Initialize the audio and video urls of the scene
     */
    init(withLocationVideo video: Asset, withMeditationTrack audio: Asset) {
        self.video = video
        self.audio = audio
    }
}
