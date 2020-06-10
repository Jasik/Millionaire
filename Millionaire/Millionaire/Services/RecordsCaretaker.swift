//
//  RecordsCaretaker.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/04.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

final class RecordCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [Result]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Result] {
        
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try self.decoder.decode([Result].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
