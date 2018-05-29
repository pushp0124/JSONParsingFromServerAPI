//
//  AlamModalClass.swift
//  FireAlamo
//
//  Created by Push_Parn on 28/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//

import Foundation
import SwiftyJSON

//Usage: This file demonstrates the MVC pattern clearly. It's a modal class describing the data returned from eah service such as Post,User as a class.
class AlamUser{
    var name: String
    var username: String
    var email: String 
    init(value: JSON){
        name = value["name"].stringValue
        username = value["username"].stringValue
        email = value["email"].stringValue
    }
}
class AlamPost{
    var userId:String
    var id:String
    var title:String
    init(value: JSON){
        userId = value["userId"].stringValue
        
        //Convert each integer value into String for easy refernce and type checking later in the app
        id = String(value["id"].intValue)
        
        title = value["title"].stringValue
    }
}
class AlamAlbum{
    var userId:String
    var id:String
    var title:String
    init(value: JSON){
        userId = String(value["userId"].intValue)
        id = String(value["id"].intValue)
        title = value["title"].stringValue
    }
}
class AlamTodo{
    var completed:String
    var id:String
    var title:String
    init(value: JSON){
        completed = value["completed"].stringValue
        id = String(value["id"].intValue)
        title = value["title"].stringValue
    }
}
class AlamComment{
    var name:String
    var id:String
    var email:String  
    init(value: JSON) {
        name = value["name"].stringValue
        id = String(value["id"].intValue)
        email = value["email"].stringValue
    }
}
