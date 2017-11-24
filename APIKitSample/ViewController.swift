//
//  ViewController.swift
//  APIKitSample
//
//  Created by Takahiro Tsuchiya on 2017/11/07.
//  Copyright © 2017 Takahiro Tsuchiya. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Session.send(GitHubAPI.SearchRepositories(query: "rxswift")) { result in
            print("1 --------------------------")
            switch result {
            case .success(let response):
                print("2 --------------------------")
                print(response)
            case .failure(.responseError(let error)):
                print("error: \(error)")
                print("3 - 1 --------------------------")
            case .failure(.connectionError(let error)):
                print("error: \(error)")
                print("3 - 2 --------------------------")
            case .failure(.requestError(let error)):
                print("error: \(error)")
                print("3 - 3 --------------------------")
            }
            print("4    --------------------------")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

