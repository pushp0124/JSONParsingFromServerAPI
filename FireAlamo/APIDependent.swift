//
//  APIDependent.swift
//  FireAlamo
//
//  Created by Push_Parn on 27/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//


//USAGE: The file defines the constants and variable Arrays :1. Alamofire Array: It contains the services offerred by the app  2. Alamofire Color: It defines the color for each cell defining a service 

import Foundation
import UIKit
class APIDependent {
    static let url = "https://jsonplaceholder.typicode.com"
    var AlamArray: [String] = []
    var AlamColor: [UIColor] = []
    let yellow = UIColor.yellow
    let magneta = UIColor.magenta
    let green = UIColor.green
    let cyan = UIColor.cyan
    let orange = UIColor.orange
    init(){
        AlamArray = ["posts","comments","albums","todos","users"]
        AlamColor = [yellow,magneta,green,cyan,orange]
    }
    
}
