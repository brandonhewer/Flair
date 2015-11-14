//
//  CryptoKey.swift
//  Flair
//
//  Created by Brandon Hewer on 14/11/2015.
//  Copyright © 2015 Brandon Hewer. All rights reserved.
//

import UIKit

class CryptoKey {
    var problemType:String = "CK";
    var specificType:String = "";
    var newString:String = "";
    var originalString:String = "";
    
    init() {
    }
    
    func generateKey(var stringToKey:String, let typeChoice:Int)->String {
        if(typeChoice==1) {
            specificType="encbase64"
            let encode = stringToKey.dataUsingEncoding(NSUTF8StringEncoding)
            stringToKey = (encode?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0)))!
            return stringToKey;
        }
        else if(typeChoice==2) {
            specificType="shuffle"
            let shufflePlace:Int = Int(arc4random_uniform(25)+1)
            let alphabet:[Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
            for(var i=0; i<stringToKey.characters.count; i++) {
                let index = specificType.startIndex.advancedBy(i)
                let currentPosition = alphabet.indexOf(specificType[index])
                let newPosition = currentPosition!+shufflePlace
                if(newPosition>25) {
                    newPosition-26;
                }
                let index2 = stringToKey.startIndex.advancedBy(i)
                stringToKey.insert(alphabet[newPosition], atIndex: index2)
            }
            if(shufflePlace<10) {
                specificType="shuffle0" + String(shufflePlace)
            }
            else {
                specificType="shuffle" + String(shufflePlace)
            }
            return stringToKey;
        }
        else {
            specificType="encbinary"
            stringToKey = String(Int(stringToKey, radix:2))
            return stringToKey
        }
    }
}
