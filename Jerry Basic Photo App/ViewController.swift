//
//  ViewController.swift
//  Jerry Basic Photo App
//
//  Created by Jeremiah Onwubuya on 9/1/15.
//  Copyright © 2015 Jeremiah Onwubuya. All rights reserved.
//

import UIKit

struct PhotoContainer {
    // This is a struct because we need to bundle this information so that we can use it later
    
    let image: UIImage
    // We don't want the image to change so we use "let" and we want the variabble to have the type "UIImage"
    
    let date: NSDate
    // We don't want to write more code than we have to, so we set date = to the already existing NextStep Date plublic superclass so we can inherit its properties.
    
}


class PhotoViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // This class will be the buiding block of this entire poject. We name it PhotoViewController for convenience and we give it the values UIViewController, UIImagePickerControllerDelegate, and UINavigatinControllerDelegate so that we can connect the ViewController.swit to the Main.storyboard.
    
    var photos = [PhotoContainer]() // <- always initialize by puting these "()" or else your code won't execute
    // this photoContaner variable holds PhotoContainer with brackets "[]" because  we want PhotoContainer to be an array.
    
    let dateFormatter = NSDateFormatter() // <- always initialize
    //The NextStep NSDateFormatter is a built in swift function that we are going to utiilize. We have the variable named dateFormatter for convenience and we use the keyword "let" because we do not want this value to change.
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // This imagePickerControleer has a type "UIImagePickerControler, did finish picking image has the type UIImage 
        // The editingInfo takes a String as an input and AnyObject as an output because it is a dictionary that hodlds information and we want to take any strinp we give it and have it return either a new string or an integer. Thep point is that this allows us to create Key Value pairs. The question mark is there because this is an optional and as long as the value is not "nil' this code will execute.
        
        photos.append(PhotoContainer(image: image, date: NSDate()))
        //we are taking the photos variable that contains the PhotoContainer array and we are adding the image "photo" and the date "NSDate", which will end up being the current date at the time when a particular photo was taken.
        
            tableView.reloadData()
            dismissViewControllerAnimated(true, completion: nil)
        // we want the view controller to have an animated dismissal because we don't want a new view to just simply appear
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
}
    // we want the number of sections in the table view to have the type UITableview. The number of rows has to be a number, hence "integer"
    // We return the value 1 because this application may contain many rows, but it only has 1 tableView where all the data will be displayed.

override func tableView(tableView: UITableView, numberOfRowsInSection Section:  Int) -> Int {
    return photos.count
    }
    // We want this function to have the type UITableview because we want it linked to the main storyboard. 
    // The number of rows in a section has to be an integer and depending on when photos are added or removed we need that integer to change and become a different integer. This integer represents the new number of rows in a section.
    
    @IBAction func didTapCameraButton(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController() // <- always initialize
        imagePicker.delegate = self
        // We want the imagePicker to be able to tell itself to do things that way we don't have to do it manually.
        
        presentViewController(imagePicker, animated: true, completion: nil)
        // We want the viewController to be presented when the UIBarButtonItem is pressed, and we want it to be presented as an animation so it doesn't simply appear.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // We want the tableView to have the type "UITableView" and we want this app to put the photos in cells that are indexed
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        // We don't want the cells to change, hence, "let". We want them to be of type UITableViewCelll. We are using an already existing defualt cell style.
        
        let photo = photos[indexPath.row]
        // We want photos that are taken to be automaticaaly put at an index path
        
        cell.imageView?.image = photo.image
        cell.textLabel?.text = dateFormatter.stringFromDate(photo.date)
        return cell
        // We want a new cell to go to the photo variable and input a new image.The question mark is there because it is an optional.
        // We also want a new cell to automatically have the image paired with the date that that image was taken
        // When an existing cell is changed we need it to be returned as a new cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad() // <- always initialize
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        // We want this viewDidLoad functino to inherit properties from the already exisoting superclass, hence super.
        // we want the way our dates are represented to take the already existing NextStepDateFormatting style, hence NSDateFormatterStyle. .LongStyle is a specific kind of style that we want to use for this project.
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // When the user's device does not have enough space to keep adding more photos we want te send theom a notification warning them that they cannot take any more photos and need to remove some.
        // didRecieveMemoryWarning is an already existing object in Swift and we are making our function inherit its properties
    
    }


}

