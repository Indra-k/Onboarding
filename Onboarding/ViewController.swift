//
//  ViewController.swift
//  Onboarding
//
//  Created by Indra Kurniawan on 03/11/20.
//

import AVKit
import AVFoundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "I'm Blue", ofType: ".mp4")!))
        
        //this will pop up iOS Player
//        let vc = AVPlayerViewController()
//        vc.player = player
//        present(vc, animated: true)
        
        //this for customize
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        player.volume = 3
        player.play()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            //show onboarding
            let vc = storyboard?.instantiateViewController(identifier: "onboarding") as! OnboardingViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    ///
    func isNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
