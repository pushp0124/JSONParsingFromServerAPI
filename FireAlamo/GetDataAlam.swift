//
//  GetDataAlam.swift
//  FireAlamo
//
//  Created by Push_Parn on 27/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetDataAlam{
    
    //The functions are made static , if not then there may be several network calls creating an instance for each one will create more memory usage
    static func getPosts(completionHandler: @escaping ([AlamPost],Bool)->()) {
        var data: [AlamPost] = []
        let alamUrl = APIDependent.url
        Alamofire.request("\(alamUrl)/posts", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON {
            (response)
            in
        
            // This is the body of the closure that gets called when response arrives:(response)->Void
            if let responseFromServer = response.result.value{
                
                //convert the data into JSON using SWIFTYJSON third party library
                 let jsonData = JSON(responseFromServer)
                
                for value in jsonData.arrayValue {
                        let post = AlamPost(value: value)
                        data.append(post)
                        }
                
                // call the completion Handler with success = true when the data is successully fetched from the server
                
                completionHandler(data,true)
              }
            else{
            
                // else call the completion Handler with success = false
                completionHandler(data,false)
            }
        }
    }
    
    static func getComments(completionHandler: @escaping ([AlamComment],Bool)->()) {
        var data: [AlamComment] = []
        let alamUrl = APIDependent.url
        Alamofire.request("\(alamUrl)/comments", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if let responseFromServer = response.result.value{
            let jsonData = JSON(responseFromServer)
            for value in jsonData.arrayValue{
                        let comment = AlamComment(value: value)
                        data.append(comment)
                    }
                    completionHandler(data,true)
                    }
            else{
                completionHandler(data,false)
            }
        }
    }
    
    static func getTodos(completionHandler: @escaping ([AlamTodo],Bool)->()) {
        var data: [AlamTodo] = []
        let alamUrl = APIDependent.url
        Alamofire.request("\(alamUrl)/todos", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if let responseFromServer = response.result.value{
                
                let jsonData = JSON(responseFromServer)
            
                    for value in jsonData.arrayValue{
                        let todo = AlamTodo(value: value)
                        data.append(todo)
                    }
                    completionHandler(data,true)
                
            }
            else{
                completionHandler(data,false)
            }
        }
    }
    
    static func getAlbums(completionHandler: @escaping ([AlamAlbum],Bool)->()) {
        var data: [AlamAlbum] = []
        let alamUrl = APIDependent.url
        
        Alamofire.request("\(alamUrl)/albums", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON
            { (response) in
            if let responseFromServer = response.result.value{
                    let jsonData = JSON(responseFromServer)
                
                    for value in jsonData.arrayValue{
                        
                        let album = AlamAlbum(value: value)
                        data.append(album)
                    }
                    completionHandler(data,true)
                
            }
            else{
                completionHandler(data,false)
            }
        }
    }

    static func getUsers(completionHandler: @escaping ([AlamUser],Bool)->()) {
        var data: [AlamUser] = []
        let alamUrl = APIDependent.url
        Alamofire.request("\(alamUrl)/users", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if let responseFromServer = response.result.value{
                
                let jsonData = JSON(responseFromServer)

                    for value in jsonData.arrayValue{
                        let user = AlamUser(value: value)
                        data.append(user)
                    }
                    completionHandler(data,true)
               
                
            }
            else{
                completionHandler(data,false)
            }
        }
    }
}
