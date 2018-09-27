//
//  CompleteProfilePage3.swift
//  ProfileViewForm
//
//  Created by Keith Gapusan on 27/09/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class CompleteProfilePage3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("3")
    }

    func setBackgroundColor(color: UIColor){
        print("color \(color)")
        self.view.backgroundColor = color
    }

}
