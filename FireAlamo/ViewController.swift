//
//  ViewController.swift
//  FireAlamo
//
//  Created by Push_Parn on 27/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//
 
import UIKit
import Alamofire
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let cellReusableCell = "CustomCell"
    
    let ApiDependentObj = APIDependent()
    
    @IBOutlet weak var AlamTableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        AlamTableView.dataSource = self
        AlamTableView.delegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //It returns the count of rows from the AlamArray made in APIDependent.swift file
        return ApiDependentObj.AlamArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200.0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Make a custom Cell using AlamCustomTableViewCell
        let cell = AlamTableView.dequeueReusableCell(withIdentifier: cellReusableCell) as! AlamCustomTableViewCell
        
        //Set the Text from the AlamArray made in APIDependent.swift file
        cell.AlamCustomLabel.text = "Want To See " + (ApiDependentObj.AlamArray[indexPath.row]).capitalized
        
        //Set the color of each Cell from the AlamColor made in APIDependent.swift file
        cell.AlamCustomView.backgroundColor = ApiDependentObj.AlamColor[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Take the action corresponding to the selected Cell
        let selectedCell =  AlamTableView.cellForRow(at: indexPath) as! AlamCustomTableViewCell
        
        //The corresponding identifier is selected from the Alam Array stored in APIDependent
        let aboutIdentifier = ApiDependentObj.AlamArray[indexPath.row]
        //Let's highlight the color of the selected cell by red
        selectedCell.AlamCustomView.backgroundColor = UIColor.red
        //Present the next view controller i.e. AlamDisplayViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlamDisplay") as! AlamDisplayViewController
        
        //Based upon the selected identifier take corresponding action
        switch aboutIdentifier {
        
        // If user selected post then call getPosts stored in GetDataAlam, similarly choose others
        case "posts":
            GetDataAlam.getPosts(completionHandler: { (data,success) -> Void
                
                //This is a completion Handler which is called when the asynchronous call get completelu executed i.e. whole data arrives
                in
                if(success == true){
                for value in data{
                    vc.firstData.append("Id: "+value.id)
                    vc.secondData.append("Title:  "+value.title)
                    vc.thirdData.append("UserId: "+value.userId)
                }
                    self.present(vc, animated: true, completion: nil)
                }
                else{
                    //If there is any errror in the fetching of data from the server then dispatch action
                    let alert = UIAlertController(title: "Some Error Occurred", message: "This might be because of down networks!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    selectedCell.AlamCustomView.backgroundColor = self.ApiDependentObj.AlamColor[indexPath.row]
                }
            })
           
        case "comments":
            GetDataAlam.getComments(completionHandler: { (data,success) -> Void
                in
                if(success == true){
                    for value in data{
                        vc.firstData.append("Id: "+value.id)
                        vc.secondData.append("Name: "+value.name)
                        vc.thirdData.append("Email: "+value.email)
                    }
                     self.present(vc, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Some Error Occurred", message: "This might be because of down networks!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    selectedCell.AlamCustomView.backgroundColor = self.ApiDependentObj.AlamColor[indexPath.row]
                }
            })
        case "todos":
            GetDataAlam.getTodos(completionHandler: { (data,success) -> Void
                in
                if(success == true){
                    for value in data{
                        vc.firstData.append("Id: "+value.id)
                        vc.secondData.append("Title: "+value.title)
                        vc.thirdData.append("isCompleted: "+value.completed)
                    }
                     self.present(vc, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Some Error Occurred", message: "This might be because of down networks!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    selectedCell.AlamCustomView.backgroundColor = self.ApiDependentObj.AlamColor[indexPath.row]
                }
            })
        case "albums":
            GetDataAlam.getAlbums(completionHandler: { (data,success) -> Void
                in
                if(success == true){
                    for value in data{
                        vc.firstData.append("Id: "+value.id)
                        vc.secondData.append("Title: "+value.title)
                        vc.thirdData.append("UserId :"+value.userId)
                    }
                     self.present(vc, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Some Error Occurred", message: "This might be because of down networks!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    selectedCell.AlamCustomView.backgroundColor = self.ApiDependentObj.AlamColor[indexPath.row]
                }
            })
        case "users":
            GetDataAlam.getUsers(completionHandler: { (data,success) -> Void
                in
                if(success == true){
                    for value in data{
                        vc.firstData.append("Name: "+value.name)
                        vc.secondData.append("Email: "+value.email)
                        vc.thirdData.append("UserName: "+value.username)
                    }
                     self.present(vc, animated: true, completion: nil)
                }
                else{
                    let alert = UIAlertController(title: "Some Error Occurred", message: "This might be because of down networks!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    selectedCell.AlamCustomView.backgroundColor = self.ApiDependentObj.AlamColor[indexPath.row]
                }
            })
        default:
            let alert = UIAlertController(title: "Some Error Occurred", message: "Wrong Action!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try Again!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            selectedCell.AlamCustomView.backgroundColor = self.ApiDependentObj.AlamColor[indexPath.row]
        }
     
  }
    
}

