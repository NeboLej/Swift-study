//
//  Networking.swift
//  ProjectTESTS
//
//  Created by Anton Pakhomov on 19.11.2021.
//

import Foundation

//typealias DataTaskCompletionHandler = (Data?, URLResponse?, Error?) -> Void
//
//protocol URLSessionProtocol {
//  func dataTask(
//    with url: URL,
//    completionHandler: @escaping DataTaskCompletionHandler
//  ) -> URLSessionDataTask
//}
//
//extension URLSession: URLSessionProtocol { }


class Networking {
    
    var urlSession: URLSessionProtocol = URLSession.shared
    
//    init(urlSession: URLSession) {
//        self.urlSession = urlSession
//    }
    
    func getReqest(completion: @escaping (DataModel)->Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {return}
        
        let task = urlSession.dataTask(with: url) { data, _, error in
          do {
            guard
                
              let data = data,
              error == nil,
              let parsData = try JSONDecoder().decode(DataModel?.self, from: data)
            else {
              return
            }
            completion(parsData)
          } catch {
            print("Error")
          }
        }
        task.resume()
    }
}

    
    
    
    
//    func postReqest(parametrs: [String : String],  complitionError: @escaping (Error)->(), complitionResponse: @escaping (URLResponse)->()){
//
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//
//        var reqest = URLRequest(url: url)
//        reqest.httpMethod = "POST"
//        reqest.addValue("application/json", forHTTPHeaderField: "Content-Type") //так джейсон нормально воспринимает словари
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametrs, options: []) else { return }
//        reqest.httpBody = httpBody
//
//
//        session.dataTask(with: reqest) { (data, response, error) in
//            if let response = response {
//                complitionResponse(response)
//                print(1)
//            }
//
//            guard let data = data else {
//                print(2)
//                return
//            }
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(3)
//            } catch {
//                complitionError(error)
//                print(4)
//            }
//        }.resume()
//
//        print(5)
//    }

//}
