//
//  BaseViewModel.swift
//  CuBa_Practice
//
//  Created by Jay Shah on 26/05/22.
//

import Foundation
import Alamofire

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
enum TypeOfApi: String {
    case login = "login"
    case register = "register"
    case userList = "users?page=2"
}

enum ApiError: Error {
    case error(error: String)
}

struct ErrorSignUpModel: Error {
    let error: String
}

enum UserDefaultsKeys: String {
    case email = "emailKey"
    case password = "passwordKey"
}
let defaults = UserDefaults.standard
class ApiService {
    
    static func apiCallUrlSession<T>(method: RequestMethod, endPoint: TypeOfApi, body: Data ,responseBody:T.Type, completionHandler: @escaping (Swift.Result<T, ErrorSignUpModel>) -> Void) where T: Codable {
        
        guard let url = URL(string: Identifiers.BaseUrl.rawValue + endPoint.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
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
                if responseCode.statusCode == Constants.successResponseCode {
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
    
    static func apiCallAlamofire<T: Codable>(baseUrl: String, endPoint: String, method: HTTPMethod, parameters: Parameters?, responseClass: T.Type, completionHandler: @escaping (Swift.Result<T, ErrorSignUpModel>) -> Void) {
        let url = baseUrl + endPoint
        AF.request(url, method: method, parameters: parameters, encoding: (parameters == nil)  ? URLEncoding.default : JSONEncoding.default, headers: [:]).response { (response) in
            guard let data = response.data else { return }
            do {
                let result = try JSONDecoder().decode(responseClass.self, from: data)
                completionHandler(.success(result))
            }
            catch {
                guard let errors = try? JSONDecoder().decode(ErrorModel.self, from: data) else {return}
                completionHandler(.failure(ErrorSignUpModel(error: errors.error)))
            }
        }
    }
}




