//
//  Teams.swift
//  demoJSON
//
//  Created by Sachin Raut on 15/06/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

class Teams
{
    var teamName: String?
    var captainName: String?
    
    var playersDictionary = JSONDictionary()
    var individualPlayer = [JSONDictionary]()
    
    
    init(data: JSONDictionary)
    {
        self.teamName = data["Name_Short"] as? String
        
        for (_, _) in data
        {
            playersDictionary = data["Players"] as! JSONDictionary
        }
        
        for (_, value) in playersDictionary
        {
            individualPlayer.append(value as! JSONDictionary)
        }
        
        for i in individualPlayer
        {
            if (i["Iscaptain"] != nil)
            {
                self.captainName = i["Name_Full"]! as? String
            }
        }
        print(self.teamName!)
        print(self.captainName!)
    }
}
