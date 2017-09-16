//
//  AppDelegate.swift
//  SMMTZC - Simple Menubar Multi Time Zone Clock
//
//  Created by Zhan Knight on 9/13/17.
//  Copyright © 2017 Zhan Knight. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // Create something for the statusbar
    var statusDisplay : NSStatusItem? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Make an object of it and give it a variable length
        statusDisplay = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        
        // and go ahead and set that object's title
        statusDisplay?.title = "SMMTZC"
        
        //
        // Create a simple drop dpwn menu for the display
        //
        
        let dropMenu = NSMenu()
//        dropMenu.addItem(NSMenuItem(title: "Not Yet", action: #selector(AppDelegate.testMe), keyEquivalent: ""))
        dropMenu.addItem(NSMenuItem(title: "Quit SMMTZC", action: #selector(AppDelegate.quitApp), keyEquivalent: "q"))
        
        statusDisplay?.menu = dropMenu
        
    }
    
    func quitApp() {
        NSApplication.shared().terminate(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

