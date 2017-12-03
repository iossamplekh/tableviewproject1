//
//  ViewController.swift
//  mysampleproject1
//
//  Created by Ron Rith on 11/30/17.
//  Copyright © 2017 Ron Rith. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var mealDataTable: UITableView!
    var mealData: [[String:String]] = []
    
    override func viewDidLoad() {
        mealDataTable.dataSource = self
        mealDataTable.delegate = self
        mealData = MealData.shared.data
        
        mealDataTable.estimatedRowHeight = 120
        mealDataTable.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "MealTableViewCell", bundle: nil)
        mealDataTable.register(nib, forCellReuseIdentifier: "MealTableViewCell")
        
        print(mealData.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell") as! MealTableViewCell
        cell.mealNameUILabel.text = mealData[indexPath.row]["name"]
       cell.mealCategoryUILabel.text = mealData[indexPath.row]["description"]
        
        return cell
    }

   
    

}

