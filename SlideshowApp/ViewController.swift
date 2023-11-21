//
//  ViewController.swift
//  SlideshowApp
//
//  Created by  NSPC358admin on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer!
    var timer_sec: Int = 0
    
    let butaImage = UIImage(named: "buta.png")
    let inuImage = UIImage(named: "inu.png")
    let kumaImage = UIImage(named: "kuma.png")
    let nekoImage = UIImage(named: "neko.png")
    let usagiImage = UIImage(named: "usagi.png")
    
    var nowImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        switch timer_sec {
        case 0,1:
            nowImage = butaImage
            
        case 2,3:
            nowImage = inuImage
            
        case 4,5:
            nowImage = kumaImage
            
        case 6,7:
            nowImage = nekoImage
            
        default:
            nowImage = usagiImage
            
        }
        
        Image.image = nowImage
        
               
    }
    
    @IBOutlet weak var Image: UIImageView!
    
    @objc func updateTimer(_ timer: Timer) {
        
        
        
        if self.timer_sec < 9 {
            self.timer_sec += 1
        } else {
            self.timer_sec = 0
        }
        
        switch timer_sec {
        case 0,1:
            nowImage = butaImage
            
        case 2,3:
            nowImage = inuImage
            
        case 4,5:
            nowImage = kumaImage
            
        case 6,7:
            nowImage = nekoImage
            
        default:
            nowImage = usagiImage
            
        }
        
        Image.image = nowImage
        
    }

    @IBAction func startTimer_senderAny(_ sender: Any) {
        
        if Slidebutton.currentTitle == "停止"{
            Slidebutton.setTitle("再生", for: .normal)
        }else{
            Slidebutton.setTitle("停止", for: .normal)
        }
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.timer = nil
        }
        
        Nextbutton.isEnabled.toggle()
        Backbutton.isEnabled.toggle()
        
        switch timer_sec {
        case 0,1:
            nowImage = butaImage
            
        case 2,3:
            nowImage = inuImage
            
        case 4,5:
            nowImage = kumaImage
            
        case 6,7:
            nowImage = nekoImage
            
        default:
            nowImage = usagiImage
            
        }
        
        Image.image = nowImage
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer_sec > 7 {
            self.timer_sec = 0
        } else {
            self.timer_sec += 2
        }
        
        switch timer_sec {
        case 0,1:
            nowImage = butaImage
            
        case 2,3:
            nowImage = inuImage
            
        case 4,5:
            nowImage = kumaImage
            
        case 6,7:
            nowImage = nekoImage
            
        default:
            nowImage = usagiImage
            
        }
        
        Image.image = nowImage
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        if self.timer_sec < 2 {
            self.timer_sec = 8
        } else {
            self.timer_sec -= 2
        }
        
        switch timer_sec {
        case 0,1:
            nowImage = butaImage
            
        case 2,3:
            nowImage = inuImage
            
        case 4,5:
            nowImage = kumaImage
            
        case 6,7:
            nowImage = nekoImage
            
        default:
            nowImage = usagiImage
            
        }
        
        Image.image = nowImage
    }
    
    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet weak var Slidebutton: UIButton!
    
    @IBOutlet weak var Nextbutton: UIButton!
    
    @IBOutlet weak var Backbutton: UIButton!
    
    @IBAction func Action(_ sender: Any) {
        
        if self.timer == nil {
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            Nextbutton.isEnabled.toggle()
            Backbutton.isEnabled.toggle()
            Slidebutton.setTitle("再生", for: .normal)
        }
        
        self.performSegue(withIdentifier: "toMagnification", sender: self.nowImage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMagnification" {
            let BB = segue.destination as! MagnificationView
            BB.Image = sender as! UIImage
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

