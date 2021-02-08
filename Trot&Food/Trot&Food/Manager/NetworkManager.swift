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
    
    func getUser(completed: @escaping (Result<[User], GFError>) -> Void) {
    
        let endpoint = baseURL + "/client/read.php?id=1"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.inavalidUsername))
            return
        }
    
    }
    
    
}
