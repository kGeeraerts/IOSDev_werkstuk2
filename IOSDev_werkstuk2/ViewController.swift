//
//  ViewController.swift
//  IOSDev_werkstuk2
//
//  Created by Quceka on 31/07/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = "https://epistat.sciensano.be/Data/COVID19BE_CASES_AGESEX.json"
        getData(from: url)
        
          
    }
    
    private func getData(from url: String) {
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            
            var results: [VacData]!
            do {
                results = try JSONDecoder().decode([VacData].self, from: data)
            }catch{
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = results else{
                return
            }
            
            print(json[0].AGEGROUP!)
            }).resume()
    }
}





struct VacData: Codable {
    let DATE: String!
    let PROVINCE : String!
    let REGION: String!
    let AGEGROUP: String!
    let SEX: String!
    let CASES: Int!
}
