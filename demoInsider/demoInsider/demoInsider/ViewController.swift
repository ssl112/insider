//
//  ViewController.swift
//  demoInsider
//
//  Created by Admin on 5.11.2023.
//

import UIKit
import IStar

class ViewController: UIViewController, IStarDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let iStarWw = IStarWebview(frame: view.bounds)
        iStarWw.delegate = self
        view.addSubview(iStarWw)
        iStarWw.addStarInterface()
    }

    func showAlertMessage(_ message: String) {//To receive alert requests from the framwork
           let alertController = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}

