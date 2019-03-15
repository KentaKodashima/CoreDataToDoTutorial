//
//  CreateVC.swift
//  CoreDataToDo
//
//  Created by Kenta Kodashima on 2019-03-14.
//  Copyright © 2019 Kenta Kodashima. All rights reserved.
//

import UIKit

class CreateVC: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var todoImage: UIImageView!
  @IBOutlet weak var todoNameField: UITextField!
  @IBOutlet weak var todoDescriptionField: UITextField!
  
  // MARK: - Properties
  private var selectedImage: UIImage!
  
  // MARK: - View controller life-cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Actions
  @IBAction func saveButtonTapped() {
    print("save button tapped")
    
    if isFieldEmpty() {
      displayEmptyFieldAlert()
    } else {
      
      resetFields()
    }
  }
  
  private func resetFields() {
    todoNameField.text = ""
    todoDescriptionField.text = ""
    todoImage.image = UIImage(named: "no-image.png")
  }
  
  // Check all required fields are filled up
  private func isFieldEmpty() -> Bool {
    var empty = true
    
    switch empty {
    case todoNameField.text?.isEmpty:
      empty = true
    case todoDescriptionField.text?.isEmpty:
      empty = true
    default:
      empty = false
    }
    
    return empty
  }
  
  private func displayEmptyFieldAlert() {
    let alert = UIAlertController(
      title: NSLocalizedString("Required field is empty.", comment: ""),
      message: NSLocalizedString("Please fill out all the fields.", comment: ""),
      preferredStyle: .alert
    )
    let defaultAction = UIAlertAction(
      title: "OK",
      style: UIAlertAction.Style.default,
      handler: nil
    )
    alert.addAction(defaultAction)
    
    present(alert, animated: true, completion: nil)
  }
  
}

extension CreateVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  // Open up device's photo library
  @IBAction func pickPicture(_ sender: UIButton) {
    let imagePicker = UIImagePickerController()
    
    setImagePicker(imagePicker: imagePicker)
    imagePicker.sourceType = .photoLibrary
    
    // Place image picker on the screen
    present(imagePicker, animated: true, completion: nil)
  }
  
  private func setImagePicker(imagePicker: UIImagePickerController) {
    imagePicker.delegate = self
    imagePicker.navigationBar.isTranslucent = false
    imagePicker.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 22)]
    imagePicker.allowsEditing = false
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    // Get picked image from info directory
    let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    
    selectedImage = image
    
    todoImage.image = selectedImage
    
    // Take image picker off the screen
    dismiss(animated: true, completion: nil)
  }
  
}
