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

    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PlaySlowSound(sender: UIButton) {
        playAudioWithCustomPitchAndRate(1, rate: 0.2)
    }
    
    @IBAction func PlayFastSound(sender: UIButton) {
        playAudioWithCustomPitchAndRate(1, rate: 1.8)
    }
    
    @IBAction func playChipmunkSound(sender: UIButton) {
        playAudioWithCustomPitchAndRate(1000, rate: 1)
    }
    
    @IBAction func playDarthVaderSound(sender: UIButton) {
        playAudioWithCustomPitchAndRate(-1000, rate: 1)
    }
    
    func playAudioWithCustomPitchAndRate(pitch: Float, rate: Float) {
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        changePitchEffect.rate = rate
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }

    @IBAction func stopAudio(sender: UIButton) {
            audioEngine.stop()
            audioEngine.reset()
    }
    
}








