//
//  Service.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import Foundation

final class Service {
        private lazy var session: URLSession = {
            let session = URLSession(configuration: .default)
            return session
        }()

    func loadRocket(completion: @escaping ([Rocket]) -> Void) {
        
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else { return }
        
        let task = session.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                return
            }
           

            do {
                let result = try JSONDecoder().decode([Rocket].self, from: data)
                completion(result)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    

    func loadLaunches(completion: @escaping ([Launch]) -> Void) {
        
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches") else { return }
        
        let task = session.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                return
            }
           

            do {
                let result = try JSONDecoder().decode([Launch].self, from: data)
                completion(result)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}


