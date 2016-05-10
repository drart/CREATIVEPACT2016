//
//  WorkSpace.swift
//  DAY9
//
//  Created by Adam Tindale on 2016-05-09.
//  Copyright © 2016 Adam Tindale. All rights reserved.
//

import UIKit

class WorkSpace: CanvasController {

    var c: Circle?
    let dur : Double = 30.0
    
    override func setup() {
        
        //        let containerAnim = ViewAnimation(duration: 5.0) {
        //            self.container.rotation += 2*M_PI
        //        }
        //        containerAnim.curve = .Linear
        //        containerAnim.repeats = true
        //        containerAnim.animate()
        
        
        c = Circle(center: canvas.center, radius: 50)
        c?.strokeEnd = 0.0
        c?.lineWidth = 1.0
        c?.strokeColor = black
        c?.fillColor = clear
        canvas.add(c)
        
        let a = ViewAnimation(duration: dur){
            self.c?.strokeEnd = 1.0
            self.c?.lineWidth = 20.0
        }
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
        
        
        
        
        ViewAnimationSequence (animations: [a,b,d,e]).animate()    }


}

