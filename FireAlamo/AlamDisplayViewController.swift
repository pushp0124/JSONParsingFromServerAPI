//
//  AlamDisplayViewController.swift
//  FireAlamo
//
//  Created by Push_Parn on 28/05/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//

import UIKit

class AlamDisplayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var DisplayTableView: UITableView!
    
    let cellIdentifier = "DisplayCell"
    // firstData secondData thirdData Arrays contains the data obtained from server and to be displayed
    var firstData: [String] = []
    
    var secondData: [String] = []
    
    var thirdData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayTableView.dataSource = self
        DisplayTableView.delegate = self
        
        // Sets the color of the separator separating the cells as Red.
        DisplayTableView.separatorColor = UIColor.red
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = DisplayTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! AlamDisplayTableViewCell
        cell.FirstLabel.text = firstData[indexPath.row]
        cell.SecondLabel.text = secondData[indexPath.row]
        cell.ThirdLabel.text = thirdData[indexPath.row]
        return cell
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        
        //It dismisses the current view controller instance and shows the parent vire controller instance which presented it
        dismiss(animated: true, completion: nil)
        
    }

}
