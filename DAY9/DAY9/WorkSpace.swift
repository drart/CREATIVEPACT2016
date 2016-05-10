//
//  WorkSpace.swift
//  DAY9
//
//  Created by Adam Tindale on 2016-05-09.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {

    var flocking = UIWebView()

    var points: [Circle] = []
    var numpoints = 100
    let dur : Double = 30.0
    
    override func setup() {
        // loads flocking.js in home.html
        flocking.mediaPlaybackRequiresUserAction = false
        let url = NSBundle.mainBundle().URLForResource("home", withExtension: "html")
        let request = NSURLRequest(URL: url!)
        flocking.loadRequest(request)
        
        for (var i = 0; i < numpoints; i++){
            var c = Circle(center: canvas.center, radius: 3)
            //c.lineWidth = 1.0
            c.strokeColor = black
            c.fillColor = clear
            //c.view.resignFirstResponder() // maybe?
            points.append(c)
            canvas.add(c)
        }
        
        let a = ViewAnimation(duration: dur){

            for x in self.points{
                x.center = Point(self.canvas.center.x - self.canvas.width/2 + random01()*self.canvas.width ,self.canvas.center.y - self.canvas.height/2 + random01()*self.canvas.height )
                x.fillColor = black
            }
            
        }
        a.animate()
        
        
        //        let containerAnim = ViewAnimation(duration: 5.0) {
        //            self.container.rotation += 2*M_PI
        //        }
        //        containerAnim.curve = .Linear
        //        containerAnim.repeats = true
        //        containerAnim.animate()
        
         /*
        let b = ViewAnimation(duration: dur){
            self.c?.fillColor = black
            self.c?.path  =  Circle(center: self.canvas.center, radius: 100).path
            self.c?.adjustToFitPath()
            self.c?.center = self.canvas.center
        }
        
        
        
        let d = ViewAnimation(duration: dur){
            let f = Rect(self.canvas.width,self.canvas.height,200,200)
            self.c?.path  = Rectangle(frame: f).path
            self.c?.adjustToFitPath()
            self.c?.center = self.canvas.center
        }
        
        d.addCompletionObserver{
            let pattern = [4.465,4.465,4.465,4.465,4.465,4.465,4.465,4.465*3.0] as [NSNumber]
            self.c?.lineDashPattern = pattern
        }
        
        
        let e = ViewAnimation(duration: dur){
            //self.c?.fillColor = clear
            self.c?.strokeColor = clear
            self.c?.lineDashPhase = 1000.0
        }
        
        let f = ViewAnimation(duration: dur){
            //self.c?.fillColor = clear
            // self.c?.rotation = 2*M_PI
        }
        
        
        
        
        ViewAnimationSequence (animations: [a,b,d,e]).animate()
         */

    }
}

