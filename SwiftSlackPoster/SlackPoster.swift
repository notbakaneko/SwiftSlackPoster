//
//  SlackPoster.swift
//  SwiftSlackPoster
//
//  Created by bakaneko on 16/01/2015.
//

import Foundation


public class SlackPoster {
    public let endpointURL: NSURL
    public var username: String?

    lazy var session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
        }()

    public init(url: NSURL) {
        self.endpointURL = url
    }

    func createField(#title: String, value: AnyObject?) -> [String:String] {
        var field = [String:String]()
        field["title"] = title
        if let v: AnyObject = value {
            field["value"] = v.description
        }

        return field
    }

    public func post(attachment: Attachment) {
        post([attachment])
    }

    public func post(attachments: [Attachment]) {
        var dictionary = [String:AnyObject]()
        if let string = username {
            dictionary["username"] = string
        }

        dictionary["attachments"] = attachments.map { $0.dictionary }

        let payload = NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.allZeros, error: nil)
        let request = NSMutableURLRequest(URL: endpointURL)
        request.HTTPMethod = "POST"
        request.HTTPBody = payload

        session.dataTaskWithRequest(request).resume()
    }
}
