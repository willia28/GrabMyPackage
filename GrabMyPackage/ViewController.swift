//
//  ViewController.swift
//  GrabMyPackage
//
//  Created by Nicholas Galasso on 1/9/16.
//  Copyright © 2016 Matt Williamson. All rights reserved.
//
// 

import UIKit

class ViewController: UIViewController {

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
        
        print(personList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

