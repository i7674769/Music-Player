//
//  SecondViewController.swift
//  Music Player
//
//  Created by Rebecca Hughes on 16/11/2017.
//  Copyright © 2017 Rebecca Hughes. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any)
    {
        if audioStuff == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
        
    }
    
    @IBAction func pause(_ sender: Any)
    {
        if audioStuff == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
            }
        
    }
    
    
    
    @IBAction func prev(_ sender: Any)
    {
        if thisSong != 0 && audioStuff == true
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs [thisSong]
            
        }
        else
        
        {
            
        }
        
    }
    
    @IBAction func next(_ sender: Any)
    {
        if thisSong < songs.count-1 && audioStuff == true
        {
            playThis(thisOne: songs[thisSong+1])
            label.text = songs [thisSong]
            thisSong += 1
        }
        else
        {
          
        }
     
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStuff == true {
            audioPlayer.volume = sender.value
        }
        
    }
    
    func playThis(thisOne:String) {
        
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
        }
            
        catch {
            print ("error")
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs [thisSong]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

