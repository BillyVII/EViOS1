//
//  ViewController.swift
//  EViOS1
//
//  Created by Student09 on 07/07/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var pwdField: UITextField!
    
    @IBOutlet weak var swift: UISwitch!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func viewDidAppear(_ animated: Bool) {
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }
}

