//
//  BaseRealmService.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RealmSwift

class BaseRealmService {
    
    
    // Delete the app and re-install is not a good practice. We should incorporate some migration steps during development from the first time we encounter migration need. The link given by SilentDirge is good: realm migration document, which gives good examples for handling different situations.
    
    //For a minimum migration task, the following code snippet from the above link can automatically do the migration and is to be used with AppDelegate's disFinishLaunchWithOptions method:
    
    let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 1,
        
        // Set the block which will be called automatically when opening a Realm with
        // a schema version lower than the one set above
        migrationBlock: { migration, oldSchemaVersion in
            // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if (oldSchemaVersion < 1) {
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
            }
    })
    
    
    let realm :Realm
    
    init() {
        
        realm = try! Realm(configuration: config)
    }
    
    
}

