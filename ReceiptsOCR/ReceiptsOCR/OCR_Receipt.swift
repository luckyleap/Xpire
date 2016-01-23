//
//  OCR_Receipt.swift
//  ReceiptsOCR
//
//  Created by David Tsui on 1/23/16.
//  Copyright © 2016 David Tsui. All rights reserved.
//

import Foundation
import UIKit
import TesseractOCR

class OCR_Receipt {
    var upc_array:[String]
    
    init(im:UIImage) {
        let tesseract:G8Tesseract = G8Tesseract(language:"eng")
        
        tesseract.charWhitelist = "0123456789";
        tesseract.image = im;
        tesseract.recognize();
        
        let regex = try! NSRegularExpression(pattern: "[0-9]{12}", options: [])
        
        
        let s = tesseract.recognizedText
        let results = regex.matchesInString(s, options: [], range:NSMakeRange(0, s.ns.length))
        
        upc_array = []
        for match in results {
            upc_array.append(s[match.range]!)
        }

    }
    func get_upc() -> [String] {
      return upc_array
    }
}