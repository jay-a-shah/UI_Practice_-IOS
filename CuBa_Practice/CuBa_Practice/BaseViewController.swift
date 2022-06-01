//
//  BaseViewController.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 29/04/22.
//

import UIKit
import Lottie

class BaseViewController: UIViewController {
    
    private var lottieAnimation: AnimationView?
    private var backLottieAnimation: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setUpProgressBar() {
        backLottieAnimation = AnimationView(name: "new")
        backLottieAnimation?.bounds = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        backLottieAnimation?.contentMode = .scaleAspectFit
        self.backLottieAnimation?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        backLottieAnimation?.center = self.view.center
        backLottieAnimation?.loopMode = .loop
        view.addSubview(self.backLottieAnimation!)
        backLottieAnimation?.play()
    }
    func endProgressBar() {
        backLottieAnimation?.stop()
        backLottieAnimation?.isHidden = true
    }
    
}

