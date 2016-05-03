//
//  WorkSpace.swift
//  DAY2
//
//  Created by Adam Tindale on 2016-05-02.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {
    
    var webview = UIWebView()
    var myshape = TextShape()
    var started = false

    override func setup() {
        // loads flocking.js in home.html
        webview.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)

        myshape.text = "Touch to Play"
        myshape.adjustToFitPath()
        myshape.center = canvas.center
        canvas.add(myshape)
        
        let playanimation = ViewAnimation(duration: 1.0){
            self.myshape.path = Rectangle(frame: Rect(0,0,100,100)).path
            self.myshape.adjustToFitPath()
            self.myshape.center = self.canvas.center
        }
        let resetanimation = ViewAnimation(duration: 1.0){
            self.myshape.path = Circle(center: self.canvas.center, radius: 50).path
            self.myshape.adjustToFitPath()
            self.myshape.center = self.canvas.center
        }
        
        myshape.addTapGestureRecognizer { locations, center, state in
            if (self.started  == false) {
                self.webview.stringByEvaluatingJavaScriptFromString("synth.play();")
                playanimation.animate()
            }else{
                self.webview.stringByEvaluatingJavaScriptFromString("synth.pause();")
                resetanimation.animate()
            }
            self.started = !self.started
        }
    }
}

