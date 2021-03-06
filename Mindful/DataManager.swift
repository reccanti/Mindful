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
    private var favorites: [String: Scene] = [:]
    
    let FAVORITES_FILE = "favorites.plist"
    
    /**
     * initialize the DataManager
     */
    private init() {
        loadFavorites()
    }
    
    // TODO: - load assets from an external source
    
    /**
     * load video assets.
     */
    func loadVideoAssets() {
        videoAssets = [
            Asset(
                name: "Cliff",
                url: Bundle.main.url(forResource: "Cliff2", withExtension: "mp4")!
            ),
            Asset(
                name: "Hills",
                url: Bundle.main.url(forResource: "Hills", withExtension: "mp4")!
            ),
            Asset(
                name: "Beach",
                url: Bundle.main.url(forResource: "Beach", withExtension: "mp4")!
            )
        ]
    }
    
    /**
     * load meditation track assets
     */
    func loadTrackAssets() {
        trackAssets = [
            Asset(
                name: "Breathing",
                url: Bundle.main.url(forResource: "01_Breathing_Meditation", withExtension: "mp3")!
            ),
            Asset(
                name: "Working through Difficulties",
                url: Bundle.main.url(forResource: "04_Meditation_for_Working_with_Difficulties", withExtension: "mp3")!
            ),
            Asset(
                name: "Positive Thinking",
                url: Bundle.main.url(forResource: "05_Loving_Kindness_Meditation", withExtension: "mp3")!
            ),
            Asset(
                name: "Body Scan",
                url: Bundle.main.url(forResource: "Body-Scan-Meditation", withExtension: "mp3")!
            )
        ]
    }
    
    // MARK: - Favorites functions
    
    /**
     * save a scene to the favorites dictionary
     */
    func addToFavorites(name: String, scene: Scene) {
        if favorites[name] == nil {
            favorites[name] = scene
            print("saved")
        }
    }
    
    /**
     * get a list of names from the favorites table
     */
    func getFavoritesNames()->[String] {
        return [String](favorites.keys)
    }
    
    /**
     * get favorite by name
     */
    func getFavoriteByName(name: String)->Scene? {
        if let favorite = favorites[name] {
            return favorite
        }
        return nil
    }
    
    /**
     * Load favorites from the documents folder
     */
    func loadFavorites() {
        if FileManager.fileExistsInDocumentsDirectory(filename: FAVORITES_FILE) {
            let pathToFile = FileManager.filePathInDocumentsDirectory(filename: FAVORITES_FILE)
            favorites = NSKeyedUnarchiver.unarchiveObject(withFile: pathToFile.path) as! [String: Scene]
            print("opened file at path \(pathToFile.path)")
        }
    }
    
    /**
     * Save favorites to a file in the documents
     * folder
     */
    func saveFavorites() {
        let pathToFile = FileManager.filePathInDocumentsDirectory(filename: FAVORITES_FILE)
        let success = NSKeyedArchiver.archiveRootObject(favorites, toFile: pathToFile.path)
        print("Saved file at path \(success)")
    }
}
