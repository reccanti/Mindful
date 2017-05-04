//
//  ViewController.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/3/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController, GVRVideoViewDelegate {
    
    @IBOutlet weak var sceneVRView: GVRVideoView!
    var sceneVideo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sceneVideo = Bundle.main.path(forResource: "Cliff", ofType: "mp4")!
        print(sceneVideo)
        
        sceneVRView.delegate = self
        sceneVRView.enableFullscreenButton = true
        sceneVRView.enableCardboardButton = true
        sceneVRView.load(from: URL(fileURLWithPath: sceneVideo))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - GVRVideoViewDelegate methods
    
    /**
     * play the video when it finishes loading
     */
    func widgetView(_ widgetView: GVRWidgetView!, didLoadContent content: Any!) {
        sceneVRView.play()
    }
    
    /**
     * Handle every time the video's time position
     * updates
     */
    func videoView(_ videoView: GVRVideoView!, didUpdatePosition position: TimeInterval) {
        print("test")
    }
}

