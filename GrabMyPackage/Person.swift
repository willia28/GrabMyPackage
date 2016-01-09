//
//  Person.swift
//  GrabMyPackage
//
//  Created by Nicholas Galasso on 1/9/16.
//  Copyright © 2016 Matt Williamson. All rights reserved.
//
// Defining a person
import Foundation

struct Person {
    
    let firstName, lastName, emailAddress: String
    
    init(firstName:String, lastName:String, emailAddress:String) {
     
        self.firstName  = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
        
    }
}


