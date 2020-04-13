//
//  AppDelegate.swift
//  SimpleMenubarClock2
//  the Swift 5 update to SMMTZC
//
//  Created by zhanknight on 3/27/20.
//
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var clockTimer: Timer?
    // ADD GLOBAL TIMEZONE ABBREV VAR HERE?!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        statusBarItem.button?.title = "SMMTZ"
        
        
        let statusBarMenu = NSMenu()
        let subOptionsMenu = NSMenu()
        let mainOptionsMenu = NSMenuItem(title: "Zones", action: nil, keyEquivalent: "")
        statusBarMenu.addItem(mainOptionsMenu)
        statusBarMenu.setSubmenu(subOptionsMenu, for: mainOptionsMenu)

        // on clicking these options, need to set the timezone abbreviation and pass to clockdisplay()
        subOptionsMenu.addItem(NSMenuItem(title: "Option 1", action: nil, keyEquivalent: ""))
        subOptionsMenu.addItem(NSMenuItem(title: "Option 2", action: nil, keyEquivalent: ""))
        
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.smmtzQuit),
            keyEquivalent: "Q")
        
    // timer that updates clock display every 2 seconds
    // is there a better way to do this than a timer
    // calling clockDisplay() over and over again?
            clockTimer = Timer.scheduledTimer(timeInterval: 2, target: self,selector:#selector(clockDisplay), userInfo: nil, repeats: true)
    }
   
  // this is the actual clock display
  // currently hard coded to show time in Jakarta
  // TODO: Make this dynamic, user selectable!
    
    @objc func clockDisplay() {
        let time = DateFormatter()
        time.timeZone = TimeZone(abbreviation: "ICT")
        time.timeStyle = .short
        statusBarItem.button?.title = "\(time.string(from:Date()))"
     }

    @objc func smmtzQuit() {
           print("TIME IS A HUMAN CONSTRUCT")
           NSApplication.shared.terminate(self)
       }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

