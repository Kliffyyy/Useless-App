//
//  URLRequest.swift
//  Useless App
//
//  Created by klifton Cheng stu on 24/6/23.
//

import Foundation

let url_ = URL(string: "https://uselessfacts.jsph.pl/api/v2/facts/random?language=en")

let task = URLSession.shared.dataTask(with: url_!, completionHandler: { (data, response, error) in
  // your code here
    if let error = error {
        print("Error accessing site: \(error)")
        return
    }
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
    else {
        print("Error with the response, unexpected status code: \(String(describing: response))")
        return
    }
    if let data = data {
        print("no data???")
        return
          }
})

struct Fact: Codable {
    let id: String
    let text: String
    let source: String
    let source_url: String
    let language: String
    let permalink: String
    
}

func callAPI(completion: @escaping (String) -> Void, link: String){
    guard let url = URL(string: link) else { return }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        let decoder = JSONDecoder()

        if data != nil{
            do {
                let jsonData = try Data(contentsOf: url_!)
                let text = try decoder.decode(Fact.self, from: jsonData)
                completion(text.text)
                
            } catch {
                print(error)
                completion("access error")
            }
        }
    }
    task.resume()
}

//callAPI()


func decodeAPI(completion: @escaping (String, String) -> Void) {
    guard let url = url_ else { return }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        let decoder = JSONDecoder()
//        let jsonData = try Data(contentsOf: url_!)
//        let jsonString = String(data: jsonData, encoding: .utf8)?.data(using: .utf8)

        if data != nil{
            do {
                let jsonData = try Data(contentsOf: url_!)
//                let jsonString = String(data: jsonData, encoding: .utf8)
//                print(jsonString)

                let text = try decoder.decode(Fact.self, from: jsonData)
                completion(text.text, text.permalink)
            } catch {
                print(error)
                completion("access error", "No link availible")
            }
        }
    }
    task.resume()

}
//decodeAPI()

