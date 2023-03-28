//
//  UIImageExtention .swift
//  AlbumiOSChallenge
//
//  Created by Ahmed on 27/03/2023.
//

import Foundation
import UIKit


extension UIImageView  {
   func loadFrom(URLAddress: String) {
       guard let url = URL(string: URLAddress) else {
           return
       }
       DispatchQueue.global(qos: .background).async {
           [weak self] in
           guard let self = self else {
               return
           }
           if let imageData = try? Data(contentsOf: url) {
               if let loadedImage = UIImage(data: imageData) {
                   DispatchQueue.main.async {
                       self.image = loadedImage
                   }
               }
           }
       }

   } 
}



