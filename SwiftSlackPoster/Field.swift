//
//  Field.swift
//  SwiftSlackPoster
//
//  Created by bakaneko on 16/01/2015.
//

import Foundation


public struct Field {
    public var title: String
    public var value: String
    public var short: Bool = false

    public var dictionary: [String:AnyObject] {
        return [
            "title": title,
            "value": value,
            "short": short
        ]
    }

    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }

    public init(title: String, value: AnyObject?) {
        self.title = title
        self.value = value?.description ?? ""
    }

    public init(title: String, value: AnyObject?, short: Bool) {
        self.title = title
        self.value = value?.description ?? ""
        self.short = short
    }
}



public func += (inout left: [Field], right: Field) {
    left.append(right)
}

public func += (inout left: [Field], right: [Field]) {
    left.extend(right)
}