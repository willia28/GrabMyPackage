//
//  ViewController.swift
//  GrabMyPackage
//
//  Created by Nicholas Galasso on 1/9/16.
//  Copyright © 2016 Matt Williamson. All rights reserved.
//
// 

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var personTableView: UITableView!
    
    let personList =
    [
        Person(firstName: "Matt", lastName: "Williamson", emailAddress: "mwilliamson@pmc.com"),
        Person(firstName: "Ernest", lastName: "Alfinez", emailAddress: "EAlfinez@pmc.com"),
        Person(firstName: "Mary", lastName: "Corbet", emailAddress: "MCorbet@pmc.com"),
        Person(firstName: "Bill", lastName: "Cotto", emailAddress: "wcotto@pmc.com")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        personTableView.dataSource = self
        
        personTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        print(personList)
    }

    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let p = personList[indexPath.row]
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            cell.textLabel?.numberOfLines = 0
            
            cell.textLabel?.text = p.firstName + " " + p.lastName + "\n" + p.emailAddress

            return cell
            
            
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    

}

