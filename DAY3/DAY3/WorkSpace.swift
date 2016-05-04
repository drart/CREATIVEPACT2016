//
//  WorkSpace.swift
//  DAY3
//
//  Created by Adam Tindale on 2016-05-03.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {
    var webview = UIWebView()

    let freqslider = UISlider()
    let ampslider = UISlider()
    
    override func setup() {
        
        // loads flocking.js in home.html
        webview.frame = CGRectMake(0, CGFloat(canvas.height/4.0), CGFloat(canvas.width), CGFloat(3.0*canvas.height/4.0))
        webview.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
        canvas.add(webview)
        

        freqslider.frame = CGRectMake(10, 50, CGFloat(canvas.width - 20), 30)
        ampslider.frame = CGRectMake(10, 100, CGFloat(canvas.width - 20), 30)

        freqslider.value = 0.4
        ampslider.value = 0.25
        
        canvas.add(freqslider)
        canvas.add(ampslider)
        
        freqslider.addTarget(self, action: "freq:", forControlEvents: UIControlEvents.ValueChanged)
        ampslider.addTarget(self, action: "amp:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func freq(sender: UISlider!){
        let myval = sender.value * 1000.0
        self.webview.stringByEvaluatingJavaScriptFromString("synth.set('singer.freq', \(myval) );")
    }

    func amp(sender: UISlider!){
        let myval = sender.value
        self.webview.stringByEvaluatingJavaScriptFromString("synth.set('singer.mul', \(myval) );")
    }
    
}

