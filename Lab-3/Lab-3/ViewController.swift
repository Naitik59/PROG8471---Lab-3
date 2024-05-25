//
//  ViewController.swift
//  Lab-3
//
//  Created by Naitik Ratilal Patel on 25/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var userInfoTextView: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up view
        setupView()
    }
    
    // add button action
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        
        userInfoTextView.text = ""
        
        // only show full name when both full name and last name text field are not empty
        if firstNameTextField.text != "" && lastNameTextField.text != "" {
            userInfoTextView.text = "Full Name: \(firstNameTextField.text ?? "") \(lastNameTextField.text ?? "")"
        }
        
        // only show country when country text field is not empty
        if countryTextField.text != "" {
            userInfoTextView.text += "\nCountry: \(countryTextField.text ?? "")"
        }
        
        // only show age when age text field is not empty
        if ageTextField.text != "" {
            userInfoTextView.text += "\nAge: \(ageTextField.text ?? "")"
        }
        
        // if all the fields are empty then show below message to user
        if userInfoTextView.text == "" {
            userInfoTextView.text = "Your information will be displayed here."
        } else {
            // show additional message to user that some text fields are still empty
            if checkForMissingData() {
                userInfoTextView.text += "\n\nSome fields are still empty! Please fill all the details."
            }
        }
    }
    
    // submite button action
    @IBAction func submitButtonDidTapped(_ sender: UIButton) {
        
        outputLabel.isHidden = false
        
        if checkForMissingData() {
            outputLabel.text = "Complete the missing info!"
            outputLabel.textColor = UIColor.red
        } else {
            outputLabel.text = "Successfully submitted!"
            outputLabel.textColor = UIColor.green
        }
    }
    
    // clear button action
    @IBAction func clearButtonDidTapped(_ sender: UIButton) {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        countryTextField.text = ""
        ageTextField.text = ""
        userInfoTextView.text = "Your information will be displayed here."
        outputLabel.isHidden = true
    }
    
    private func setupView() {
        
        // hidding label inititally
        outputLabel.isHidden =  true
        
        // adding border to text view
        userInfoTextView.layer.borderWidth = 1
        userInfoTextView.layer.borderColor = UIColor.black.cgColor
        userInfoTextView.layer.cornerRadius = 5
        
        // disabling user interaction of text view as it intends to show the user information and it should allow user to change it
        userInfoTextView.isUserInteractionEnabled = false
        
        // assigning delegate to each text field to use delegate methods of UITextField
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        countryTextField.delegate = self
        ageTextField.delegate = self
    }
    
    // checking for missing text field data
    private func checkForMissingData() -> Bool {
        
        if firstNameTextField.text == "" || lastNameTextField.text == "" || countryTextField.text == "" || ageTextField.text == "" {
            return true
        }
        
        return false
    }
}

extension ViewController: UITextFieldDelegate {
    
    // hide label when user starts editing text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        outputLabel.isHidden = true
    }
}
