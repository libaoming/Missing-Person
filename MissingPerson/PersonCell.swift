//
//  PersonCell.swift
//  MissingPerson
//
//  Created by 李宝明 on 16/8/21.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var  personImg: UIImageView!
    
    func configure(imgUrl: String){
        
        if let url = NSURL(string: imgUrl) {
             downloadImage(url)
            
        }
    }
    
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

}
