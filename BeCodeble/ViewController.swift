//
//  ViewController.swift
//  BeCodeble
//
//  Created by 123 on 08.09.17.
//  Copyright © 2017 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func sendPostTapped(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newPost = Post(body: "What are u doing this week", id: 127, title: "Encoding staff", userId: 55)
        
        
        do {
            let jsonBody = try JSONEncoder().encode(newPost)
            request.httpBody = jsonBody
            
        } catch {
            
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, request, error) in
            guard let data = data else { return }
            do {
                let sentPost = try JSONDecoder().decode(Post.self, from: data)
                print(sentPost)
            } catch {}
        }
        
        task.resume()
        print("send")
    }
    
    @IBAction func getPostTapped(_ sender: Any) {
        print("get")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                for user in users {
                    print(user.address.geo)
                }
                
            } catch {}
        }
        
        task.resume()
        
    }
}

