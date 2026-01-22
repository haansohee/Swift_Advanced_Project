//
//  HospitalNetwork.swift
//  FindVeteransHospital
//
//  Created by 한소희 on 1/20/26.
//

import Foundation
import Combine

final class HospitalNetwork {
    private let session: URLSession
    private let api = HospitalAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getHospitalList() -> AnyPublisher<[Hospital], URLError> {
        guard let url = api.getHospitalListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        
        var request = URLRequest(url: url)
        request.setValue(SecretKey.key.rawValue, forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpRepsonse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                print("httpResonse status code: \(httpRepsonse.statusCode)")
                switch httpRepsonse.statusCode {
                case 200..<300:
                    return data
                case 400..<500:
                    throw URLError(.clientCertificateRejected)
                case 500..<599:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            .decode(type: HospitalAPIResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .mapError { $0 as! URLError }
            .eraseToAnyPublisher()
    }
}
