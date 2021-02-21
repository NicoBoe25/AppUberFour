//
//  AppetizeImageView.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 21/02/2021.
//

import UIKit

class AppetizerImageView: UIImageView {
    let cache = NetworkManager.shared.cache;
    let placeholderImage = UIImage(named: "NotFound")
    
    func downloadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString);
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image;
            return;
        }
        
        guard let url = URL(string: urlString) else { return; }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return; }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return; }
            guard let data = data else { return; }
            guard let image = UIImage(data: data) else { return; }
            
            self.cache.setObject(image, forKey: cacheKey);
            DispatchQueue.main.async {
                self.image = image;
            }
        }
        
        task.resume();
    }
}
