//
//  ViewController.swift
//  MissingPerson
//
//  Created by 李宝明 on 16/8/21.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectImg: UIImageView!
    
    
    let baseURl = "http://localhost:6069/img/"
    let imagePicker = UIImagePickerController()
    
    let missingPeople =  [
        
        "person1.jpg",
        "person2.jpg",
        "person3.jpg",
        "person4.jpg",
        "person5.jpg",
        "person6.png",
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(loadImage(_:)))
        
        tap.numberOfTapsRequired = 1
        
        selectImg.addGestureRecognizer(tap)
        
        
        
        
        
    }

  
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPeople.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCell
        
        let url = "\(baseURl)\(missingPeople[indexPath.row])"
        cell.configure(url)
        return cell
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectImg.image = pickedImage
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func loadImage(gesture: UITapGestureRecognizer){
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func checkForMatch(sender: AnyObject) {
    }
}




















