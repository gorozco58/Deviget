//
//  Credentials.swift
//  Deviget
//
//  Created by Giovanny Orozco Loaiza on 19/06/21.
//  Copyright © 2021 Giovanny Orozco Loaiza. All rights reserved.
//

import Foundation

public class Credentials: NSObject, Codable, NSCoding {

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
        case expirationTimeStamp = "expires_in"
    }

    public let accessToken: String
    public let tokenType: String
    public let refreshToken: String
    public let expirationTimeStamp: Int
    private(set) public var creationDate = Date()
    public var expirationDate: Date {
        return creationDate.addingTimeInterval(TimeInterval(expirationTimeStamp))
    }

    public var isTokenExpired: Bool {
        return Date() >= expirationDate
    }

    public required init?(coder: NSCoder) {
        accessToken = coder.decodeObject(forKey: CodingKeys.accessToken.rawValue) as? String ?? ""
        tokenType = coder.decodeObject(forKey: CodingKeys.tokenType.rawValue) as? String ?? ""
        refreshToken = coder.decodeObject(forKey: CodingKeys.refreshToken.rawValue) as? String ?? ""
        expirationTimeStamp = coder.decodeInteger(forKey: CodingKeys.expirationTimeStamp.rawValue)
        creationDate = coder.decodeObject(forKey: "CreationDate") as? Date ?? Date()
    }

    public func encode(with coder: NSCoder) {
        coder.encode(accessToken, forKey: CodingKeys.accessToken.rawValue)
        coder.encode(tokenType, forKey: CodingKeys.tokenType.rawValue)
        coder.encode(refreshToken, forKey: CodingKeys.refreshToken.rawValue)
        coder.encode(expirationTimeStamp, forKey: CodingKeys.expirationTimeStamp.rawValue)
        coder.encode(creationDate, forKey: "CreationDate")
    }
}



