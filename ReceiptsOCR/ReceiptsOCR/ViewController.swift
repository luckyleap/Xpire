//
//  ViewController.swift
//  ReceiptsOCR
//
//  Created by David Tsui on 1/22/16.
//  Copyright © 2016 David Tsui. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.image = UIImage(named: "abc.png")
        
        self.view.addSubview(imageView)
        
        let a: OCR_Receipt = OCR_Receipt(im:imageView.image!)
        print(a.get_upc())
//        let tesseract:G8Tesseract = G8Tesseract(language:"eng")
//        tesseract.delegate = self;
//        
//        tesseract.charWhitelist = "0123456789";
//        tesseract.image = UIImage(named: "abc.png");
//        tesseract.recognize();
//        
//        let regex = try! NSRegularExpression(pattern: "[0-9]{12}", options: [])
//       
//
//        let s = tesseract.recognizedText
//        let results = regex.matchesInString(s, options: [], range:NSMakeRange(0, s.ns.length))
//        
//        for match in results {
//             print("match = \(s[match.range]!)")
//        }
        
        
        //image_receipt.image = UIImage(named: "receipt1.png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

