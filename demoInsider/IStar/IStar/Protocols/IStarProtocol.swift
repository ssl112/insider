//
//  IStarProtocol.swift
//  IStar
//
//  Created by Admin on 6.11.2023.
//

import Foundation

/*

 This class provides making requests from the UI
 
*/

public protocol IStarDelegate: class {
    func showAlertMessage(_ message: String)
}
