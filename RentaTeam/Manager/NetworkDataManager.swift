//
//  NetworkDataManager.swift
//  RentaTeam
//
//  Created by Kirill Drozdov on 10.03.2022.
//

import Foundation


class NetworkDataManager {

    private var networkRequestManager = NetworkRequestManager()

    func fetchImages(searchKeyWord: String, completion: @escaping (RequestResults?) -> ()) {
        networkRequestManager.request(searchKeyWord: searchKeyWord) { (data, error) in
            if let error = error {
                print("Error! Data was not received \(error.localizedDescription)")
                completion(nil)
            }
            let decodedData = self.decodeJSON(type: RequestResults.self, from: data)
            completion(decodedData)
        }
    }

    func decodeJSON<T: Codable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let data = from else { return nil }

        do {
            let items = try decoder.decode(type.self, from: data)
            return items
        }catch let decodeError {
            print("Decoding was failed", decodeError)
            return nil
        }
    }
}
