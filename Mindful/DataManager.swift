//
//  DataManager.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/8/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import Foundation

class DataManager {
    static let instance = DataManager()
    var videoAssets: [Asset] = []
    var trackAssets: [Asset] = []
    private init() {}
    
    // TODO: - load assets from an external source
    
    /**
     * load video assets.
     */
    func loadVideoAssets() {
        let sceneVideo = Asset(
            name: "Cliff",
            url: Bundle.main.url(forResource: "Cliff", withExtension: "mp4")!
        )
        videoAssets = [sceneVideo]
    }
    
    /**
     * load meditation track assets
     */
    func loadTrackAssets() {
        let sceneAudio = Asset(
            name: "Breathing 01",
            url: Bundle.main.url(forResource: "01_Breathing_Meditation", withExtension: "mp3")!
        )
        trackAssets = [sceneAudio]
    }
}
