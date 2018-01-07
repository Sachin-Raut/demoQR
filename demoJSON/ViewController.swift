//
//  ViewController.swift
//  demoJSON
//
//  Created by Sachin Raut on 14/06/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var team1: UILabel!
    
    @IBOutlet weak var team2: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    var teams = [Teams]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let api = APIManager()
        api.loadData("http://matchcentre.starsports.com/cricket/data/181066.json") { (teams) in
            self.teams = teams
            
            //lets move back to main thread
            DispatchQueue.main.async {
                
                //UIKit elements (label, textField etc) should always be executed on main thread
                
                self.team1.text = teams[0].teamName
                self.team2.text = teams[1].teamName
                
                
                self.label1.text = teams[0].captainName
                self.label2.text = teams[1].captainName
            }
        }
    }
}

