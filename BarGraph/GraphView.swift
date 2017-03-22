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
class GraphView: UIView { //can change depending on if it creates default functions or not
    //let CalcData: DiscountCalc = DiscountCalc.shared
    override func draw(_ rect: CGRect) {
        //need to unwrap optional value
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        //to create a border
        let leftGuide:CGFloat = 16.0
        //let rightGuide:CGFloat = screenWidth - 16.0
        let topGuide:CGFloat = 72.0
        //let botGuide:CGFloat = screenHeight - 16.0
        
        //Draw rectangle
        //define a color, grab context and specify color then coordinates
        //alpha is whether the color will be transparent or solid
        //context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context.setFillColor(0xFFFFFF)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth - 32.0, height:screenHeight - 96.0))
        //coordinates are not via pixels, it is by points; will not scale
        //origin is at top left
        
        //Draw Text
        let myText = "CyanBox"
        let subText = "Baby blue..."
        
        //Text Attributes
        let textAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!, NSForegroundColorAttributeName: UIColor(red:1.0, green: 1.0, blue: 1.0,alpha:1.0)] //unwrap incase font name does not exist
        
        myText.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0), withAttributes: textAttributes)
        subText.draw(at: CGPoint(x:leftGuide + 16.0, y: topGuide + 16.0), withAttributes: textAttributes)
        
        // Drawing code
    }

}
