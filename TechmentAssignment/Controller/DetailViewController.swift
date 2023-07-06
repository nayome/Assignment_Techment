//
//  DetailViewController.swift
//  TechmentAssignment
//
//  Created by NayomeDevapriyaAnga on 04/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//

import UIKit
protocol dataUpdatingDelegate:AnyObject {
    func onUpdate(updatedData: DetailsModel)
}

class DetailViewController: UIViewController {
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ownerTextField: UITextField!
    weak var delegate: dataUpdatingDelegate?
    var cellVM:DetailsModel = DetailsModel.init(id: 0, full_name: "", description: "", owner: "", language: "")

        //= ItemDetail(id: 0, fullName: "", owner: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameTextField.text = cellVM.full_name
        ownerTextField.text = cellVM.owner
        descriptionTextView.text = cellVM.description ?? ""
        // Do any additional setup after loading the view.
        fullNameTextField.addTarget(self, action: #selector(fullNameModified), for: .editingChanged)
        ownerTextField.addTarget(self, action: #selector(ownerLoginModified), for: .editingChanged)
        descriptionTextView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveDetails))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func fullNameModified() {
        if let textEntered = fullNameTextField.text {
            cellVM.full_name = textEntered
        }
    }

    @objc func ownerLoginModified() {
        if let textEntered = ownerTextField.text {
            cellVM.owner = textEntered
        }
    }

    @objc func saveDetails() {
        delegate?.onUpdate(updatedData: self.cellVM)
        self.navigationController?.popViewController(animated: true)
        print("Save Details")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let textEntered = textView.text {
            self.cellVM.description = textEntered
        }
    }
}


