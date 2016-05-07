//
//  WorkSpace.swift
//  DAY6
//
//  Created by Adam Tindale on 2016-05-06.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {

    let trigger = UIButton(type:UIButtonType.System)
    var flocking = UIWebView()

    override func setup() {
        // loads flocking.js in home.html
        flocking.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        flocking.loadRequest(request)
        
        trigger.frame = CGRectMake(0, 0, 100, 30)
        trigger.center = CGPoint(canvas.center)
        trigger.setTitle("Press Me", forState: .Normal)
        canvas.add(trigger)
        
        trigger.addTarget(self, action: "triggerFlock", forControlEvents: .TouchDown)
        trigger.addTarget(self, action: "triggerFlockOff", forControlEvents: .TouchUpInside)
    }

    func triggerFlock(){
        self.flocking.stringByEvaluatingJavaScriptFromString("synth.set('thing.mul.gate', 1);")
    }
    
    func triggerFlockOff(){
        self.flocking.stringByEvaluatingJavaScriptFromString("synth.set('thing.mul.gate', 0);")
    }

}

