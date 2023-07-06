//
//  ViewController.swift
//  TechmentAssignment
//
//  Created by NayomeDevapriyaAnga on 01/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation.isPortrait {
            self.stackView.axis = .vertical
            self.stackView.distribution = .equalSpacing
            self.stackView.alignment = .fill
            
        } else {
            self.stackView.axis = .horizontal
            self.stackView.distribution = .fillEqually
            self.stackView.alignment = .bottom
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (context) -> Void in
            
            let orientation = UIApplication.shared.statusBarOrientation
            
            if orientation.isPortrait {
                self.stackView.axis = .vertical
                self.stackView.distribution = .equalSpacing
                self.stackView.alignment = .fill

            } else {
                self.stackView.axis = .horizontal
                self.stackView.distribution = .fillEqually
                self.stackView.alignment = .bottom
            }
            
        }, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController.init(title: "Enter User Details", message: "Please enter Username and Password to Login", preferredStyle: .alert )
        
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { _ in
            //print("ok clled")
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func OnClickSubmitButton(_ sender: Any) {
        print("Submit clicked")
        guard let username = userNameTextField.text == "" ? nil : userNameTextField.text else {
            showAlert()
            return
        }
        guard let passwd = passwordTextField.text == "" ? nil : passwordTextField.text else {
            showAlert()
            return
        }

        print("\(username) and \(passwd) entered")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let tagNumber = textField.tag
        print("Text Entered is \(String(describing: textField.text)) and \(tagNumber)");
    }
}

