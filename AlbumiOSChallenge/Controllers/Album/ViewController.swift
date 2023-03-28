//
//  ViewController.swift
//  AlbumiOSChallenge
//
//  Created by Ahmed on 27/03/2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var AlbumCollectionView: UICollectionView!
    
    //MARK: - Variables
    
    var albumApi = AlbumeApi()
    var photosArray : [Photo] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetUp()
        getAlbumDataFromApi()
        
    }
    
    //MARK: - Functions
    func getAlbumDataFromApi(){
        albumApi.getAlbumData { data in
            DispatchQueue.main.async {
                self.photosArray = data
                self.AlbumCollectionView.reloadData() 
             }
        }
    }
    
    
    func uiSetUp(){
        navigationController?.navigationBar.prefersLargeTitles = true 
        AlbumCollectionView.dataSource = self
        AlbumCollectionView.delegate = self
    }
}



extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.ID, for: indexPath) as! PhotoCollectionViewCell
        cell.PhotoImg.loadFrom(URLAddress: photosArray[indexPath.row].urls.regular)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2 ,height: collectionView.bounds.height / 3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: ShowImageVC.ID) as! ShowImageVC
        vc.selectedImage = photosArray[indexPath.row].urls.regular
        navigationController?.pushViewController(vc, animated: true) 
    }
    
}
