//
//  APIManager.swift
//  demoJSON
//
//  Created by Sachin Raut on 14/06/17.
//  Copyright © 2017 Sachin Raut. All rights reserved.
//

import Foundation

class APIManager
{
    
    func loadData(_ urlString: String, completion:@escaping ([Teams])-> Void)
    {
        //create singleton object
        
        let session = URLSession.shared
        
        let url = URL(string: urlString)!
        
        //initiate task
        
        let task = session.dataTask(with: url)
        {
            
            (data, response, error) in
            
            do
            {
                
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? JSONDictionary, let teams = json["Teams"] as? JSONDictionary
                {
                    //print(teams)
                    
                    var fetchedTeams = [Teams]()
                    
                    for (_, value) in teams
                    {
                        let entry = Teams(data: value as! JSONDictionary)
                        
                        fetchedTeams.append(entry)
                    }
                    //print(fetchedTeams.count)
                    //print(fetchedTeams[0].captainName!)
                    
                    
                    //go back to main thread & send fetchedTeams
                    DispatchQueue.main.async
                    {
                        completion(fetchedTeams)
                    }                    
                }
            }
            catch
            {
                print("error in jsonserialization")
            }
            
        }
        task.resume()
        
    }
    
}
