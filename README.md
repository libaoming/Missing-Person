# Missing-Person

### add Tap gesture Recognizer 

```swift
 let tap = UITapGestureRecognizer(target: self, action: #selector(loadImage(_:)))
        
        tap.numberOfTapsRequired = 1
        
        selectImg.addGestureRecognizer(tap)
```

> tapGetureRecognizer action func  <br>
  check selectImg user action enabled

```swift
 func loadImage(gesture: UITapGestureRecognizer){
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
```

### add imagePicker 

* initializer 
```swift
let imagePicker = UIImagePickerController()
 override func viewDidLoad() {
        imagePicker.delegate = self
}
```

* viewController add  UIImagePickerControllerDelegate, UINavigationControllerDelegate 
```swift
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate
```


```swift
 func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectImg.image = pickedImage
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
```




