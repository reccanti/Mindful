//
//  CreateFavoriteVC.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/14/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class CreateFavoriteVC: UIViewController {

    var location: Asset!
    var meditationTrack: Asset!
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create a default name for the track
        nameField.text = "\(meditationTrack.name) by the \(location.name)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
