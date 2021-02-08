//
//  NetworkManager.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 08/02/2021.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager()
        
    let baseURL = "https://uberfour.online/trotfood/api"
    let cache = NSCache<NSString, UIImage>()
 
    private init(){}
    
    func getUser(completed: @escaping (Result<[User], TFError>) -> Void) {
    
        let endpoint = baseURL + "/client/read.php?id=1"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.inavalidUser))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
                
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode([User].self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
    
}
