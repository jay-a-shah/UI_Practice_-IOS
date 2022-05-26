//
//  BaseViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 26/05/22.
//

import Foundation
import QuartzCore

class BaseViewModel: NSObject {
    
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
    
    static func apiCall<T: Codable>(_ url: String,method: RequestMethod,endPoint: TypeOfApi,responseDataType: T.Type,completionHandler: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = URL(string: Identifiers.BaseUrl.rawValue + endPoint.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
       
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                completionHandler(.failure(ApiError.error(error:error.localizedDescription)))
                return
            }
            guard let responseData = data else{ return }
            guard let responseData = try? JSONDecoder().decode(responseDataType.self, from: responseData) else { return }
                    completionHandler(.success(responseData))
                  }.resume()
        }
        
    }
    

