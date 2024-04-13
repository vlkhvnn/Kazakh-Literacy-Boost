//
//  APICaller.swift
//  HackNU
//
//  Created by Alikhan Tangirbergen on 13.04.2024.
//

import Foundation
import Alamofire

struct Constants {
    static let YoutubeAPI_KEY = "AIzaSyDDwUP9nKFeOJPaWnaNeLthbpoIDSBQeek"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    static let API_KEY = "43ded7021f1ee5aef9956a51c88fc840"
    static let baseURL = "https://www.themoviedb.org"
}

final class APICaller {
    
    static let shared = APICaller()
    
    private let audioMessageURLString = "https://storage.googleapis.com/tarihshy-bucket/kelesovnurtore@gmail.com_1_2ccc4791-acb3-4dfa-bfac-c4992bd68e76"
    
    func getAudioMessage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: audioMessageURLString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        // Alamofire request
        AF.request(url, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
