//
//  BaseViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 26/05/22.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
enum TypeOfApi: String {
    case login = "login"
    case register = "register"
}

enum ApiError: Error {
    case error(error: String)
}

struct ErrorSignUpModel: Error {
    let error: String
}

class ApiService {
    
    static func apiCall<T>(method: String, endPoint: String, body: Data ,responseBody:T.Type, completionHandler: @escaping (Swift.Result<T, ErrorSignUpModel>) -> Void) where T: Codable {
        guard let url = URL(string: Identifiers.BaseUrl.rawValue + endPoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue(Constants.headerValue, forHTTPHeaderField: Constants.headerValueContentType)
        request.addValue(Constants.headerValue, forHTTPHeaderField: Constants.headerValueAccept)
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                completionHandler(.failure(ErrorSignUpModel(error: "Api Failure")))
                return
            }
            guard let responseData = data else{ return }
            if let responseCode = urlResponse as? HTTPURLResponse{
                if responseCode.statusCode == 200 {
                    print("Success")
                    guard let responseData = try? JSONDecoder().decode(T.self, from: responseData) else { return }
                    completionHandler(.success(responseData))
                } else {
                    print("Error")
                    guard let failureData = try? JSONDecoder().decode(ErrorModel.self, from: responseData) else { return }
                    completionHandler(.failure(ErrorSignUpModel(error: failureData.error)))
                }
            }
           
        }.resume()
    }
    
    
}




