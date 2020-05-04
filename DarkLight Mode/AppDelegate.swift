//
//  AppDelegate.swift
//  DarkLight Mode
//
//  Created by Noah Evans on 01/05/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import Cocoa
import Automator


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        let itemImage = NSImage(named: "barIcon")
        itemImage?.isTemplate = true
        statusBarItem?.button?.image = itemImage

        let statusBarMenu = NSMenu(title: "DarkLight Mode")
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Switch Theme",
            action: #selector(AppDelegate.switchTheme),
            keyEquivalent: "")
    }


    @objc func switchTheme() {
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
        


        
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

}
