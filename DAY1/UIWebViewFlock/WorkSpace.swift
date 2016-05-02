//
//  WorkSpace.swift
//  UIWebViewFlock
//
//  Created by Adam Tindale on 2016-05-01.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {
    
    var webview = UIWebView()

    override func setup() {
        webview.frame = CGRectMake(0, 0, 200, 200)
        webview.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        webview.loadRequest(request)
        canvas.add(webview)
        
        // doesn't work
        //webview.stringByEvaluatingJavaScriptFromString("alert('ffff')")
        
        // doesn't work
        /*
        let xx:String?
        xx = webview.stringByEvaluatingJavaScriptFromString("$('#ttt').html('something else')")
        print(xx!)
        */
        
        canvas.addTapGestureRecognizer { locations, center, state in
            //self.webview.stringByEvaluatingJavaScriptFromString("alert('ffff')") // works
            self.webview.stringByEvaluatingJavaScriptFromString("$('#ttt').html('something else')")
            // doesn't work
            //self.webview.stringByEvaluatingJavaScriptFromString("document.getElementById('some_sound').play();")
            //self.webview.stringByEvaluatingJavaScriptFromString("synth.play();")
            
        }
    }
}
