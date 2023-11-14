//
//  Constants.swift
//  IStar
//
//  Created by Admin on 6.11.2023.
//

import Foundation

/*
 
 This class stores constant variables
 
*/

public struct Constants {
    static let shared = Constants()
    
    let webviewURL = "https://img.etimg.com/thumb/msid-72948091,width-650,imgsize-95069,,resiz emode-4,quality-100/star_istock.jpg"
    
    enum sizeTypes:String{
        case S = "S"
        case B = "B"
    }
    
    enum brightnessTypes:String{
        case Bright    = "Bright"
        case NotSoMuch = "Not so much"
    }

    enum colorTypes:String{
        case Red    = "Red"
        case Blue   = "Blue"
        case Green  = "Green"
        case Yellow = "Yellow"
        case Purple = "Purple"
        case Gray   = "Gray"
    }
}




