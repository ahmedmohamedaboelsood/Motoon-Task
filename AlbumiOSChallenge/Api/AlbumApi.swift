//
//  AlbumApi.swift
//  AlbumiOSChallenge
//
//  Created by Ahmed on 27/03/2023.
//

import Foundation
 

class AlbumeApi{
    
  
    
    private static let apiKey = "Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
    private static let unsplashUrl = "https://api.unsplash.com/photos/?client_id=\(apiKey)"
   
    
    func getAlbumData(complition:@escaping([Photo])->Void){
        
        guard let url = URL(string: AlbumeApi.unsplashUrl) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
           
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                var photosArray : [Photo] = []
                for i in photos {
                    photosArray.append(i)
                } 
                    complition(photosArray)
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}


