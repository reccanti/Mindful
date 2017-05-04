//
//  ViewController.swift
//  Mindful
//
//  Created by Benjamin Wilcox on 5/3/17.
//  Copyright © 2017 Benjamin Wilcox. All rights reserved.
//

import UIKit
import AVFoundation

class SceneViewController: UIViewController, GVRVideoViewDelegate {
    
    @IBOutlet weak var sceneVRView: GVRVideoView!
    var track: AVAudioPlayer!
    var scene: Scene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: - load dynamic scene elsewhere and pass here
        let sceneVideo = Bundle.main.url(forResource: "Cliff", withExtension: "mp4")!
        let sceneAudio = Bundle.main.url(forResource: "01_Breathing_Meditation", withExtension: "mp3")!
        scene = Scene(withLocationVideo: sceneVideo, withMeditationTrack: sceneAudio)
        
        
        // initialize the Video for the scene
        
        sceneVRView.delegate = self
        sceneVRView.enableFullscreenButton = true
        sceneVRView.enableCardboardButton = true
        sceneVRView.load(from: scene.video)
        
        // initialize the audio for the scene
        
        try! track = AVAudioPlayer(contentsOf: scene.audio)
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        track.prepareToPlay()
        track.play()
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
        sceneVRView.volume = 0.1
        sceneVRView.play()
    }
    
    /**
     * Handle every time the video's time position
     * updates.
     */
    func videoView(_ videoView: GVRVideoView!, didUpdatePosition position: TimeInterval) {
        // Loop the video when it reaches the end
        if position == videoView.duration() {
            videoView.seek(to: 0)
            videoView.play()
        }
    }
}

