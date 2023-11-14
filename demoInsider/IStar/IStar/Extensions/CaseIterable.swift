//
//  EnumExtensions.swift
//  IStar
//
//  Created by Admin on 6.11.2023.
//

import Foundation

/*

 This extension provides random elements for color & brightness types
 
*/

extension Constants.brightnessTypes: CaseIterable {
    static var allCases: [Constants.brightnessTypes] {
        return [.Bright,.NotSoMuch]
    }
}

extension Constants.colorTypes: CaseIterable {
    static var allCases: [Constants.colorTypes] {
        return []
    }
    
    static var smallCases: [Constants.colorTypes] {
        return [.Red,.Blue,.Green]
    }
    
    static var bigCases: [Constants.colorTypes] {
        return [.Yellow,.Purple,.Gray]
    }
}
