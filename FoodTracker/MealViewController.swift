//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Mario Ban on 17.04.16.
//  Copyright © 2016 Mario Ban. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, /* protocols */ UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  // MARK: Properties

  @IBOutlet weak var nameTextField: UITextField!
  //@IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  @IBOutlet weak var saveButton: UIBarButtonItem!

  /*
   This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
   or constructed as part of adding a new meal.
   */
  var meal: Meal?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    // Handle the text field’s user input through delegate callbacks.
    nameTextField.delegate = self

    // Set up views if editing an existing Meal.
    if let meal = meal {
      navigationItem.title = meal.name

      nameTextField.text   = meal.name
      nameTextField.accessibilityIdentifier = "nameText"
      nameTextField.accessibilityLabel = meal.name
      photoImageView.image = meal.photo
      photoImageView.accessibilityIdentifier = "PhotoView"
      ratingControl.rating = meal.rating
      ratingControl.accessibilityIdentifier = "RatingControl"
    }

    // Enable the Save button only if the text field has a valid Meal name.
    checkValidMealName()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.

  }

  func checkValidMealName() {
    // Disable the Save button if the text field is empty.
    let text = nameTextField.text ?? ""
    saveButton.isEnabled = !text.isEmpty
  }

  // MARK: UITextFieldDelegate

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Hide the keyboard.
    textField.resignFirstResponder()
    return true
  }

  func textFieldDidBeginEditing(_ textField: UITextField) {
    // Disable the Save button while editing.
    saveButton.isEnabled = false
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    //mealNameLabel.text = textField.text
    checkValidMealName()
    navigationItem.title = textField.text
  }

  // MARK: UIImagePickerControllerDelegate

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    // Dismiss the picker if the user canceled.
    dismiss(animated: true, completion: nil)
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    // The info dictionary contains multiple representations of the image, and this uses the original.
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage

    // Set photoImageView to display the selected image.
    photoImageView.image = selectedImage

    // Dismiss the picker.
    dismiss(animated: true, completion: nil)
  }

  // MARK: Navigation

  @IBAction func cancel(_ sender: UIBarButtonItem) {
    // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
    let isPresentingInAddMealMode = presentingViewController is UINavigationController

    if isPresentingInAddMealMode {
      dismiss(animated: true, completion: nil)
    }
    else {
      navigationController!.popViewController(animated: true)
    }
  }

  // This method lets you configure a view controller before it's presented.
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let s = sender as? UIBarButtonItem { // M.Ban Swift 2 --> Swift 3
      if saveButton === s {
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating

        // Set the meal to be passed to MealTableViewController after the unwind segue.
        meal = Meal(name: name, photo: photo, rating: rating)
      }
    }
  }

  // MARK: Actions

  @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    // Hide the keyboard (just in case).
    nameTextField.resignFirstResponder()

    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    let imagePickerController = UIImagePickerController()

    // Only allow photos to be picked, not taken.
    imagePickerController.sourceType = .photoLibrary

    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self

    present(imagePickerController, animated: true, completion: nil)
  }

  /*
  @IBAction func setDefaultLabelText(sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }
  */

}
