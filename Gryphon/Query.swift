//
//  Gryphon
//  Created by rinov on 9/17/16.
//  Copyright © 2016 rinov. All rights reserved.
//

import Foundation

// Serves query making which consisting of multiple query.

public final class Query {
    
    var isEmpty: Bool {

        return queries.isEmpty
        
    }
    
    var count: Int {
        
        return queries.count
        
    }

    //Key : Value dictionary.
    var queries: [String: AnyObject] = [:]
    
    //URL format query.
    var absoluteString: String {

        return joinElements()
    
    }
    
    //URL format query with BASE64 encoding.
    var absoluteStringWithBase64: String {
        
        let body = absoluteString.dataUsingEncoding(NSUTF8StringEncoding)

        let base64Str = body!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        
        return base64Str
        
    }
    
    func append(key: String, value: AnyObject) -> Self {
        
        queries[key] = value
        
        return self
        
    }
    
    func append(key: String, value: AnyObject?) -> Self {

        guard let value = value else { return self }
        
        queries[key] = value
        
        return self
    }
    
    func hasKey(key: String) -> Bool {
        
        guard let _ = queries[key] else { return false }
        
        return true
        
    }
    
    // MARK: Private Methods
    
    private func joinElements() -> String {
        
        let valueSeparator = "="
        
        let querySeparator = "&"
        
        let absoluteQuery = ""
        
        return queries.reduce(absoluteQuery) { query, queries in
            query + querySeparator + queries.0 + valueSeparator + String(queries.1)
        }
    }
    
}
