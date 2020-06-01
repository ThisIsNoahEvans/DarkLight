//
//  AppDelegate.swift
//  DarkLight Menu Bar
//
//  Created by Noah Evans on 30/05/2020.
//  Copyright © 2020 Noah Evans. All rights reserved.
//

import Cocoa
import Automator
import Foundation

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
                keyEquivalent: "D")
        
            statusBarMenu.addItem(
                withTitle: "Quit",
                action: #selector(AppDelegate.quitApp),
                keyEquivalent: "q")
        }
    
    
    
   @objc func quitApp() {
    NSApplication.shared.terminate(self)
    }

        @objc func switchTheme() {
            NSWorkspace.shared.open(URL(fileURLWithPath: "/Library/Application Support/VelocityApps.DarkLight-Menu-Bar/DarkLight Menu Bar Helper Tool.app"))

            
    }
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    


}

