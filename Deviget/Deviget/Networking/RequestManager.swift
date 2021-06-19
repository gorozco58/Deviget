//
//  RequestManager.swift
//  Deviget
//
//  Created by Giovanny Orozco Loaiza on 19/06/21.
//  Copyright © 2021 Giovanny Orozco Loaiza. All rights reserved.
//

import Foundation

class RequestManager {
    
    private let session: URLSession
    static var shared: RequestManager = .init()
    private let credentialsPath = "credentials.obj"
    private(set) public var credentials: Credentials?
    
    private init() {
        self.session = URLSession(configuration: .default)
        credentials = getSessionCredentials()
    }
    
    func request(_ request: Request) {
        
    }
    
    public func updateCredentials(_ credentials: Credentials, shouldSave: Bool) throws {
        self.credentials = credentials
        
        if shouldSave {
            let fullPath = URL.documentsDirectory.appendingPathComponent(credentialsPath)
            let data = try NSKeyedArchiver.archivedData(withRootObject: credentials, requiringSecureCoding: false)
            try data.write(to: fullPath)
        }
    }
    
    public func removeSession() throws {
        let fullPath = URL.documentsDirectory.appendingPathComponent(credentialsPath)
        do {
            try FileManager.default.removeItem(at: fullPath)
            credentials = nil
        }
    }
}

//MARK: - Private methods
private extension RequestManager {
    
    func getSessionCredentials() -> Credentials? {
        let fullPath = URL.documentsDirectory.appendingPathComponent(credentialsPath)
        
        if let data = try? Data(contentsOf: fullPath) {
            if let credentials = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Credentials {
                return credentials
            }
        }
        return nil
    }
}
