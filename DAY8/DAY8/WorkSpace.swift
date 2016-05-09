//
//  WorkSpace.swift
//  DAY8
//
//  Created by Adam Tindale on 2016-05-08.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {

    var flocking = UIWebView()
    let freqslider = UISlider()
    let mulslider = UISlider()
    let ffslider = UISlider()
    
    override func setup() {
        // loads flocking.js in home.html
        flocking.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        flocking.loadRequest(request)
        
        freqslider.frame = CGRectMake(10, CGFloat(canvas.height/2 - 15), CGFloat(canvas.width - 20), 30)
        freqslider.value = 0.4
        canvas.add(freqslider)
        
        freqslider.addTarget(self, action: "freq:", forControlEvents: UIControlEvents.ValueChanged)

        mulslider.frame = CGRectMake(10, CGFloat(canvas.height/2 + 30), CGFloat(canvas.width - 20), 30)
        mulslider.value = 0.4
        canvas.add(mulslider)

        mulslider.addTarget(self, action: "mul:", forControlEvents: UIControlEvents.ValueChanged)

        
        
        ffslider.frame = CGRectMake(10, CGFloat(canvas.height/2 + 75), CGFloat(canvas.width - 20), 30)
        ffslider.value = 0.4
        canvas.add(ffslider)
        
        ffslider.addTarget(self, action: "ff:", forControlEvents: UIControlEvents.ValueChanged)

    }
    
    func freq(sender: UISlider!){
        let myval = sender.value * 100.0
        self.flocking.stringByEvaluatingJavaScriptFromString("synth.set('thing.freq.freq', \(myval) );")
    }
    
    func mul(sender: UISlider!){
        let myval = sender.value * 100.0
        self.flocking.stringByEvaluatingJavaScriptFromString("synth.set('thing.mul.freq', \(myval) );")
    }

    func ff(sender: UISlider!){
        let myval = sender.value * 2000.0
        self.flocking.stringByEvaluatingJavaScriptFromString("synth.set('thing.freq.add', \(myval) );")
    }
}

