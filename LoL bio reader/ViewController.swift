//
//  ViewController.swift
//  LoL bio reader
//
//  Created by owajhin on 2020/11/28.
//  Copyright © 2020 OWAJHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        let button = UIButton(frame: CGRect(x: 40, y: 100, width: 200, height: 100))
        button.backgroundColor = .blue
        button.setTitle("おはよう", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
