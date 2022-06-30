//
//  ViewController.swift
//  musicFromApi
//
//  Created by Raghav Deo on 30/05/22.
//

import UIKit
import AVFoundation
import AVKit
import AVFAudio
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func playButton(_ sender: Any) {
      
        
        let urlstring = "http://radio.spainmedia.es/wp-content/uploads/2015/12/tailtoddle_lo4.mp3"
        let url = NSURL(string: urlstring)
        print("the url = \(url!)")
        downloadFileFromURL(url: url! as URL )
        
        
        
        
        
                 
    }
    func downloadFileFromURL(url:URL){

        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
                if let localURL = localURL {
                        if let string = try? String(contentsOf: localURL) {
                                print(string)
                            self.play(url: localURL as NSURL)
                        }
                }
        }
        task.resume()

    }
        
    func play(url:NSURL) {
        print("playing \(url)")
        do {
            let player = try AVAudioPlayer(contentsOf: url as URL)
            player.prepareToPlay()
            player.volume = 1.0
            player.play()
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
    func playMusic(data: Data) {
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("voice.mp3")
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                   let player = try AVAudioPlayer(contentsOf: fileURL, fileTypeHint: AVFileType.mp3.rawValue)

                    /* iOS 10 and earlier require the following line:
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                    //guard let player = player else { return }

                    player.play()
               } catch let error {
                   print(error.localizedDescription)
               }

            

               
    }


}

