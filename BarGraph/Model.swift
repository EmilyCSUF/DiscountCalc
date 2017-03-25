//
//  Model.swift
//  BarGraph
//
//  Created by Emily Michelle Lin on 3/24/17.
//  Copyright © 2017 Emily Michelle Lin. All rights reserved.
//

import Foundation

class Data
{
    public static var shared: Data = Data()
    init()
    {
        originalPrice = 0;
        discountPrice = 0;
    }
    
    public var originalPrice: Float
    public var discountPrice: Float
}
