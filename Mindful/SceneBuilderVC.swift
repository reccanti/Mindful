//
//  SceneBuilderVC.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/8/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class SceneBuilderVC: UITableViewController {

    // MARK: - ivars
    var meditationTrack: Asset?
    var location: Asset?
    @IBOutlet weak var locationCell: UITableViewCell!
    @IBOutlet weak var meditationTrackCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // set styles
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * a function that updates the labels of
     * the table cells to display the name of the
     * asset
     */
    private func updateLabels() {
        meditationTrackCell.textLabel?.text = meditationTrack?.name ?? "(None)"
        locationCell.textLabel?.text = location?.name ?? "(None)"
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loadSceneSegue" {
            guard let locationURL = location?.url, let meditationTrackURL = meditationTrack?.url else {
                return false
            }
        }
        if identifier == "saveSceneSegue" {
            guard let locationURL = location?.url, let meditationTrackURL = meditationTrack?.url else {
                return false
            }
        }
        return true
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // pass location and track to scene VC
        if segue.identifier == "loadSceneSegue" {
            guard let destinationNav = segue.destination as? UINavigationController else {
                return
            }
            guard let destination = destinationNav.topViewController as? SceneViewController else {
                return
            }
            destination.scene = Scene(withLocationVideo: location!, withMeditationTrack: meditationTrack!)
        }
        
        // pass the location and track to the favorite VC
        if segue.identifier == "saveSceneSegue" {
            guard let destinationNav = segue.destination as? UINavigationController else {
                return
            }
            guard let destination = destinationNav.topViewController as? CreateFavoriteVC else {
                return
            }
            destination.location = location!
            destination.meditationTrack = meditationTrack!
        }
        
    }
    
    
    /**
     * Unwind to the scene builder without
     * selecting anythins
     */
    @IBAction func cancelToSceneBuilder(segue: UIStoryboardSegue) {
        //
    }
    
    /**
     * Unwind to this view with a meditation track
     */
    @IBAction func unwindWithTrack(sender: UIStoryboardSegue) {
        updateLabels()
    }
    
    /**
     * Unwind to this view with a location
     */
    @IBAction func unwindWithLocation(sender: UIStoryboardSegue) {
        updateLabels()
    }
    
    /**
     * Unwind to this view with both a meditation track and location
     */
    @IBAction func unwindWithScene(sender: UIStoryboardSegue) {
        updateLabels()
    }

}
