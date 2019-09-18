//
//  CurrentVC.swift
//  Treads
//
//  Created by KhanhNguyen on 9/16/19.
//  Copyright © 2019 KhanhNguyen. All rights reserved.
//

import UIKit

class CurrentVC: LocationVC {

    @IBOutlet weak var swipeBGImageView: UIImageView!
    
    
    @IBOutlet weak var sliderImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(endRunSwipe(sender: )))
        sliderImageView.addGestureRecognizer(swipeGesture)
        sliderImageView.isUserInteractionEnabled = true
        swipeGesture.delegate = self as? UIGestureRecognizerDelegate
    }
    
    @objc func endRunSwipe(sender: UIPanGestureRecognizer) {
        let minAdjust: CGFloat = 80
        let maxAdjust: CGFloat = 128
        if let sliderView = sender.view {
            if sender.state == UIGestureRecognizer.State.began || sender.state == UIGestureRecognizer.State.changed {
                let tranlation = sender.translation(in: self.view)
                if sliderView.center.x >= (swipeBGImageView.center.x - minAdjust) && sliderView.center.x <= (swipeBGImageView.center.x + maxAdjust) {
                    sliderView.center = CGPoint(x: sliderView.center.x + tranlation.x, y: sliderView.center.y)
                } else if sliderView.center.x >= (swipeBGImageView.center.x + maxAdjust) {
                    sliderView.center.x = swipeBGImageView.center.x + maxAdjust
                    dismiss(animated: true, completion: nil)
                } else {
                    sliderView.center.x = swipeBGImageView.center.x - minAdjust
                }
                sender.setTranslation(CGPoint.zero, in: self.view)
            } else if sender.state == UIGestureRecognizer.State.ended {
                UIView.animate(withDuration: 0.2) {
                    sliderView.center.x = self.swipeBGImageView.center.x - minAdjust
                }
            }
        }
    }
    
}
