//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Quynh Tran on 22/08/2015.
//  Copyright (c) 2015 Quynh. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, AVAudioPlayerDelegate {

    var myPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")!)
//        var error: NSError?
        
        myPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        myPlayer.enableRate = true
        myPlayer.delegate = self
        myPlayer.prepareToPlay()
        
//        if let err = error {
//            println("audioPlayer error \(err.localizedDescription)")
//        } else {
//            myPlayer?.delegate = self
//            myPlayer?.prepareToPlay()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PlaySlowSound(sender: UIButton) {
            myPlayer.stop()
            myPlayer.rate = 0.7
            myPlayer.currentTime = 0.0
            myPlayer.play()
    }
    
    @IBAction func PlayFastSound(sender: UIButton) {
            myPlayer.stop()
            myPlayer.rate = 1.5
            myPlayer.currentTime = 0.0
            myPlayer.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
            myPlayer.stop()
    }
    
}








