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

