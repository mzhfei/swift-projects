//
//  CodableBundleExtension.swift
//  TouchDown
//
//  Created by Mengzhe Fei on 2023-12-12.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) in bundle")

        }
        
        let decoder = JSONDecoder()
            
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) in bundle")
        }
        
        return decodedData
    }
    
}
