//
//  WorkSpace.swift
//  DAY7
//
//  Created by Adam Tindale on 2016-05-07.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {
    
    var start = TextShape(text: "Look for Myos")
    
    override func setup() {
        let notifer = NSNotificationCenter.defaultCenter()
        notifer.addObserver(self, selector: "didConnectDevice:", name: TLMHubDidConnectDeviceNotification, object: nil)
        notifer.addObserver(self, selector: "didChangePose:", name: TLMMyoDidReceivePoseChangedNotification, object: nil)

        start!.addTapGestureRecognizer { location, point, state in
            let controller = TLMSettingsViewController.settingsInNavigationController()
            self.presentViewController(controller, animated: true, completion: nil)
        }
        start!.frame = Rect(0,0,canvas.width/2, canvas.height/2)
        start!.adjustToFitPath()
        start!.center = canvas.center
        canvas.add(start)
    }
    
    func didConnectDevice(notification: NSNotification) {
        start!.text = "Hello Myo"
        start!.center = canvas.center
    }


    func didChangePose(notification: NSNotification) {
        let eventData = notification.userInfo as! Dictionary<NSString, TLMPose>
        let currentPose = eventData[kTLMKeyPose]!
        
        print(currentPose)
        
        switch (currentPose.type) {
        case .Fist:
            start!.text = "Fist"
        case .WaveIn:
            start!.text = "Wave In"
        case .WaveOut:
            start!.text = "Wave Out"
        case .FingersSpread:
            start!.text = "Fingers Spread"
        case .DoubleTap:
           start!.text = "Double Tap"
        default: // .Rest or .Unknown
            start!.text = "Hello Myo"

        }
        start!.center = canvas.center
    }



}



