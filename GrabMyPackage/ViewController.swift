//
//  ViewController.swift
//  GrabMyPackage
//
//  Created by Nicholas Galasso on 1/9/16.
//  Copyright © 2016 Matt Williamson. All rights reserved.
//
// 

import UIKit
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {

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

    /*
    if MFMailComposeViewController.canSendMail() {
    let controller = MFMailComposeViewController()
    
    let subject = NSMutableString()
    
    subject.appendString("\(BizLogic.venueName()): ")
    
    if let notes = self.notes {
    subject.appendString("\(notes) ")
    }
    
    subject.appendString("\n#\(self.orderNumber)")
    
    controller.setSubject(subject as String)
    controller.setToRecipients([BizLogic.businessEmail()])
    controller.setMessageBody(self.stringFromOrder(self.order), isHTML: false)
    controller.mailComposeDelegate = self
    
    self.presentViewController(controller, animated: true, completion: { () -> Void in
    
    })
    }
*/
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let p = personList[indexPath.row]
        
        if MFMailComposeViewController.canSendMail() {
            let controller = MFMailComposeViewController()
            
            let subject = NSMutableString()
            
            subject.appendString(p.firstName + " you have a package!")
            
            
            controller.setSubject(subject as String)
            controller.setToRecipients([p.emailAddress])
            controller.setMessageBody("Please come pick up your package from the secon floor Mail Room", isHTML: false)
            controller.mailComposeDelegate = self
            
            self.presentViewController(controller, animated: true, completion: { () -> Void in
                
            })
            
            
        
        }
        
    }
  
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        print(result)
        
        if let e = error {
            print(e.localizedDescription)
        }
        
        if result == MFMailComposeResultSent {
            controller.dismissViewControllerAnimated(true) { () -> Void in
                
            }
        }
    }
/*
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
    
    
    print(result)
    
    if let e = error {
    print(e.localizedDescription)
    }
    
    if result == MFMailComposeResultSent {
    
    self.trackOrder()
    
    self.presentingViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in
    })
    
    } else if result == MFMailComposeResultSaved{
    controller.dismissViewControllerAnimated(true) { () -> Void in
    
    }
    } else if result == MFMailComposeResultFailed {
    controller.dismissViewControllerAnimated(true) { () -> Void in
    
    }
    } else if result == MFMailComposeResultCancelled{
    controller.dismissViewControllerAnimated(true) { () -> Void in
    
    }
    }
    
    }
*/
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}

