//
//  ViewController.swift
//  GrabMyPackage
//
//  Created by Nicholas Galasso on 1/9/16.
//  Copyright © 2016 Matt Williamson. All rights reserved.
//
// 

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var personTableView: UITableView!
    
    let personList =
    [
        Person(firstName: "Matt", lastName: "Williamson", emailAddress: "mwilliamson@pmc.com"),
        Person(firstName: "Ernest", lastName: "Alfinez", emailAddress: "EAlfinez@pmc.com"),
        Person(firstName: "Mary", lastName: "Corbet", emailAddress: "MCorbet@pmc.com"),
        Person(firstName: "Bill", lastName: "Cotto", emailAddress: "wcotto@pmc.com")
        
    ]
// MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        personTableView.dataSource = self
        personTableView.delegate = self
        
        personTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        print(personList)
    }
// MARK: UI Table View Datasource
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let p = personList[indexPath.row]
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            cell.textLabel?.numberOfLines = 0
            
            cell.textLabel?.text = p.firstName + " " + p.lastName + "\n" + p.emailAddress

            cell.contentView.backgroundColor = UIColor.cyanColor()
            
            return cell
            
            
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
// MARK: UI Table View Delegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let p = personList[indexPath.row]
        
        
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}

