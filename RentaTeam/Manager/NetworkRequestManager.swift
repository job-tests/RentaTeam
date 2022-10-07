//
//  NetworkRequestManager.swift
//  RentaTeam
//
//  Created by Kirill Drozdov on 10.03.2022.
//

import Foundation


class NetworkRequestManager {

    func request(searchKeyWord: String, completion: @escaping (Data?, Error?) -> Void) {

        let parameters = self.generateParameters(searchKeyWord: searchKeyWord)
        let url = self.generateUrl(parameters: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = generateHeaders()
        request.httpMethod = "get"
        let dataTask = makeDataTask(from: request, completion: completion)
        dataTask.resume()
    }

    // MARK: Private methods with settings for url request

    private func makeDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }

    private func generateHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID J_PW-ZivB6q24i-CwFA1DU0W_k2D0m-E82Rd5jAsHQo"
        return headers
    }

    private func generateParameters(searchKeyWord: String?) -> [String: String]{
        var parameters = [String : String]()
        parameters["query"] = searchKeyWord
        parameters["page"] = String(1)
        parameters["per_page"] = String(100)
        return parameters
    }

    private func generateUrl(parameters: [String: String]) -> URL {
        var componets = URLComponents()
        componets.scheme = "https"
        componets.host = "api.unsplash.com"
        componets.path = "/search/photos"
        componets.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        return componets.url!
    }

}
