//
//  AppDelegate.swift
//  DarkLight Menu Bar Helper Tool
//
//  Created by Noah Evans on 31/05/2020.
//  Copyright © 2020 Noah Evans. All rights reserved.
//

import Cocoa
import Automator

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func changeTheme() {
              guard let workflowPath = Bundle.main.path(forResource: "script", ofType: "workflow") else {
                      print("Workflow resource not found")
                      let alert = NSAlert()
                      alert.alertStyle = .critical
                      alert.messageText = "There was an issue changing the system theme."
                      alert.informativeText = "Please reinstall the application."
                      alert.runModal()
                      return
                  }

                  let workflowURL = URL(fileURLWithPath: workflowPath)
                  do {
                      try AMWorkflow.run(at:workflowURL, withInput: nil)
                  } catch {
                      print("Error running workflow: \(error)")
                      
              }
        print("Done, quitting...")
        NSApplication.shared.terminate(self)
          }




    func applicationDidFinishLaunching(_ aNotification: Notification) {
        changeTheme()
        

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

        
      
}

}
