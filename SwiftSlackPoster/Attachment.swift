//
//  Attachment.swift
//  SwiftSlackPoster
//
//  Created by bakaneko on 16/01/2015.
//

import Foundation


public struct Attachment {
    public var text: String?
    public var pretext: String?
    public var fallback: String
    public var color: String
    public var fields: [Field]

    public var dictionary: [String:AnyObject] {
        var dictionary: [String:AnyObject] = [
            "fallback": fallback,
            "color": color
        ]
        dictionary["fields"] = fields.map { $0.dictionary }

        if let string = text {
            dictionary["text"] = string
        }

        if let string = pretext {
            dictionary["pretext"] = string
        }

        return dictionary
    }
}