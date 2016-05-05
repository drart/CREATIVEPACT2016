//
//  WorkSpace.swift
//  DAY4
//
//  Created by Adam Tindale on 2016-05-04.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {
    var webview = UIWebView()
    
    let freqslider = UISlider()
    
    override func setup() {
        // loads flocking.js in home.html
        webview.frame = CGRectMake(0, CGFloat(canvas.height/4.0), CGFloat(canvas.width), CGFloat(3.0*canvas.height/4.0))
        webview.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
        
        
        freqslider.frame = CGRectMake(10, CGFloat(canvas.height/2 - 15), CGFloat(canvas.width - 20), 30)
        freqslider.value = 0.1
        canvas.add(freqslider)
        
        freqslider.addTarget(self, action: "freq:", forControlEvents: UIControlEvents.ValueChanged)
    
    }
    func freq(sender: UISlider!){
        let myval = sender.value * 20.0
        self.webview.stringByEvaluatingJavaScriptFromString("synth.set('lefthat.mul.gate.freq', \(myval) );synth.set('righthat.mul.gate.freq', \(myval) );")
    }

}

