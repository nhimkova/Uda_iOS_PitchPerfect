//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Quynh Tran on 24/08/2015.
//  Copyright (c) 2015 Quynh. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    
    var filePathURL: NSURL!
    var title: String!
    init(path: NSURL, title: String){
        self.filePathURL = path
        self.title = title
    }
    
}