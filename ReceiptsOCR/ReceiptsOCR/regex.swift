//
//  regex.swift
//  ReceiptsOCR
//
//  Created by David Tsui on 1/23/16.
//  Copyright © 2016 David Tsui. All rights reserved.
//

import Foundation

public extension String {
    
    public func rangeFromNSRange(aRange: NSRange) -> Range<String.Index> {
        let s = self.startIndex.advancedBy(aRange.location)
        let e = self.startIndex.advancedBy(aRange.location + aRange.length)
        return s..<e
    }
    public var ns : NSString {return self as NSString}
    public subscript (aRange: NSRange) -> String? {
        get {return self.substringWithRange(self.rangeFromNSRange(aRange))}
    }
    
    public var cdr: String {return isEmpty ? "" : String(characters.dropFirst())}
    
    public func toCamel() throws -> String {
        var s = self
        let regex = try NSRegularExpression(pattern: "_+(.)", options: [])
        let matches = regex.matchesInString(s, options:[], range:NSMakeRange(0, s.ns.length)).reverse()
        for match in matches {
            print("match = \(s[match.range]!)")
            let matchRange = s.rangeFromNSRange(match.range) // the whole match range
            let replaceRange = match.rangeAtIndex(1)         // range of the capture group
            let uc = s[replaceRange]!.uppercaseString
            s.replaceRange(matchRange, with: uc)
        }
        if s.hasPrefix("_") {s = s.cdr}
        return s
    }
}