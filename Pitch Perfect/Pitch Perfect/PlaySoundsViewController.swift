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

    var myPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")!)
        var error: NSError?
        
        myPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        myPlayer?.enableRate = true
        
        if let err = error {
            println("audioPlayer error \(err.localizedDescription)")
        } else {
            myPlayer?.delegate = self
            myPlayer?.prepareToPlay()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func PlaySlowSound(sender: UIButton) {
        if let player = myPlayer {
            player.stop()
            player.rate = 0.7
            player.currentTime = 0.0
            player.play()
        }
    }
    
    @IBAction func PlayFastSound(sender: UIButton) {
        if let player = myPlayer {
            player.stop()
            player.rate = 1.5
            player.currentTime = 0.0
            player.play()
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        if let player = myPlayer {
            player.stop()
        }
    }
    
}








