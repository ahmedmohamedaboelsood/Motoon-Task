//
//  PhotoCollectionViewCell.swift
//  AlbumiOSChallenge
//
//  Created by Ahmed on 27/03/2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
   
    //MARK: - IBOutlet
    @IBOutlet weak var PhotoImg: UIImageView!
   
    //MARK: - Variables
    static let ID = String(describing: PhotoCollectionViewCell.self)
    
}
