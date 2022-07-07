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
    
    @IBOutlet weak var myswitch: UISwitch!
    
    @IBOutlet weak var showHiddenButton: UIButton!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // reglage du bouton swift pour la newsletter
        myswitch.isOn = false
        myswitch.backgroundColor = .gray
        // reglage du bouton d'affichage pwd
        showHiddenButton.setImage(UIImage(named:"eye_off_icon"), for: .normal)
        showHiddenButton.setTitle("", for:.normal)
        showHiddenButton.imageView?.contentMode = .scaleAspectFit
        showHiddenButton.addTarget(self, action: #selector(showPassword),
                                   for: .touchUpInside)
        pwdField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        userImage.layer.cornerRadius = userImage.frame.width / 2
        
    }
    
    @IBAction func showPassword(_ sender: Any) {
        
        if(pwdField.isSecureTextEntry == true){
            showHiddenButton.setImage(UIImage(named: "eye_on_icon"), for: .normal)
            showHiddenButton.imageView?.contentMode = .scaleAspectFit
            pwdField.isSecureTextEntry = false
        }
        else{
            showHiddenButton.setImage(UIImage(named:"eye_off_icon"), for: .normal)
            showHiddenButton.imageView?.contentMode = .scaleAspectFit
            pwdField.isSecureTextEntry = true
        }
        
        
    }
    @IBAction func didTapOnLoginButton() {
        
        if(loginField.text != ""){
            if(pwdField.text != ""){
                // si il y un @
                    // si au moins 4 caractères
                if(myswitch.isOn == true) {
                    // s'il s'est inscrit à la news letter
                    let alertNewsLetter = UIAlertController(title: "Bienvenue \(loginField.text ?? "")", message: "Vous vous êtes inscrit à la newsletter", preferredStyle:
                    .alert)
                    //add buttons
                    alertNewsLetter.addAction(UIAlertAction(title: "Merci !", style: .cancel, handler: nil))
                    present(alertNewsLetter, animated: true)
                }
                else{
                    // s'il ne s'est pas inscrit à la newsletter
                    let alert = UIAlertController(title: "Bienvenue \(loginField.text ?? "")", message: "Vous ne vous êtes pas inscrit à la newsletter", preferredStyle:
                    .alert)
                    //add buttons
                    alert.addAction(UIAlertAction(title: "Merci", style: .cancel, handler: nil))
                    present(alert, animated: true)
                }
            }
            else {
                // s'il y a une erreur
                let alertErreur = UIAlertController(title: "Erreur", message: "Une condition n'est pas respecté", preferredStyle:
                .alert)
                //add buttons
                alertErreur.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                present(alertErreur, animated: true)
            }
        }
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
