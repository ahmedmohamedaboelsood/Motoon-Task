//
//  ShowImageVC.swift
//  AlbumiOSChallenge
//
//  Created by Ahmed on 27/03/2023.
//

import UIKit

class ShowImageVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var PhotoImg: UIImageView!
    
    //MARK: - Variables
    
    static let ID = String(describing: ShowImageVC.self) 
    var selectedImage : String?
    var originalTransform: CGAffineTransform!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetUp()
        zoomPhoto()
    }
    
    
    //MARK: - Functions
    
    func uiSetUp(){
        if let image = selectedImage{
            PhotoImg.loadFrom(URLAddress: image)
        }
    }
     
    func zoomPhoto(){
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchHandler(_:)))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler))
        originalTransform = PhotoImg.transform
        PhotoImg.isUserInteractionEnabled = true
        PhotoImg.addGestureRecognizer(tap)
        PhotoImg.addGestureRecognizer(pinch)
    }
    
    @objc func pinchHandler(_ sender:UIPinchGestureRecognizer){
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1
    }
    
    @objc func tapHandler(){
        UIView.animate(withDuration: 0.3) {
            self.PhotoImg.transform = self.originalTransform
        }
    }
     
    
}
