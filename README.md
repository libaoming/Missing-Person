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


* add imagePickerController func 
```swift
 func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectImg.image = pickedImage
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
```

### Web request 
* initializer 
> let baseURl = "http://localhost:6069/img/"

* collectionview cell initilizer
```swift
 func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCell
        
        let url = "\(baseURl)\(missingPeople[indexPath.row])"
        cell.configure(url)
        return cell
    }
```


### web request download image
```swift
    func  downloadImage(url: NSURL){
        
        getDataFromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()){ () -> Void in
                
                guard let data = data where error == nil else {return}
                
                self.personImg.image = UIImage(data: data)
                
            }
        }
        
    }
    
    func getDataFromUrl(url: NSURL,completion: ((data: NSData?,response: NSURLResponse?, error: NSError?) -> Void)){
        NSURLSession.sharedSession().dataTaskWithURL(url){
            
            (data, response , error ) in
            
            completion(data: data, response: response, error: error)
            
        }.resume()
    }
    
     func configure(imgUrl: String){
        
        if let url = NSURL(string: imgUrl) {
             downloadImage(url)
            
        }
    }

```
