//
//  CCalculator.swift
//  BarGraph
//
//  Created by Emily Michelle Lin on 3/6/17.
//  Copyright © 2017 Emily Michelle Lin. All rights reserved.
//

import UIKit

extension CGContext {
    func setFillColor(_ hex:Int){
        //Mask different values of the hex code
        //0xFF0000 - Red
        //0x00FF00 - Green
        //0x0000FF - Blue
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF)/255.0 //bitshift hex to 16 places; in binary
        let greenColor:CGFloat = CGFloat((hex>>8) & 0xFF)/255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF)/255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}
class GraphView: UIView {
    
    //let CalcData: DiscountCalc = DiscountCalc.shared
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        //CG prefix is like OPENGLprefix stuff
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let leftGuide:CGFloat = 0
        let rightGuide:CGFloat = screenWidth - leftGuide
        let topGuide:CGFloat = 62
        let bottomGuide:CGFloat = screenHeight - topGuide
        let HalfGuide:CGFloat = screenWidth / 2
        
        //imports data into local variables for easier access
        let original = Data.shared.originalPrice
        let discount = Data.shared.discountPrice
        var saved = original - discount
        
        //draw rect total
        context.setFillColor(0xFE6F5E)
        context.fill(CGRect(x:leftGuide,y:topGuide,width: HalfGuide ,height:screenHeight))
        
        //draw the rectangle for how much you saved
        context.setFillColor(0xFEF65B)
        let savedHeight = screenHeight * CGFloat(saved / original)
        context.fill(CGRect(x: screenWidth , y: topGuide , width: HalfGuide - rightGuide , height:savedHeight))
        
        //draw the rectangle for how much you need to pay
        context.setFillColor(0x0F19CBB)
        context.fill(CGRect(x: screenWidth , y:topGuide + savedHeight , width: HalfGuide - rightGuide , height: screenHeight - savedHeight))
        
        
        /*
         height = 726
         width = 414
         */
        
        
        //creating string to overlay percentages
        let textoriginal = "Original:" + String(format: "%.2f", original)
        let textsaved = "You Saved\n" + String(format: "%.2f", saved) + "\n" + String(format: "%.2f", saved/original) + "%"
        let textdiscount = "Pay:" + String(format: "%.2f", discount) + "\n" + String(format: "%.2f", 100-saved/original) + "%"
        

        let textAttributes = [
            NSFontAttributeName: UIFont(name:"Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        textoriginal.draw(at: CGPoint(x: 0,y:topGuide),withAttributes: textAttributes)
        textsaved.draw(at: CGPoint(x: HalfGuide,y:topGuide),withAttributes: textAttributes)
        textdiscount.draw(at: CGPoint(x: HalfGuide,y: (topGuide+savedHeight)),withAttributes: textAttributes)
    }
}
