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

    //experiments in options windows
    var optionsWindow = OptionsWindow()
    var timezone1 : String = ""
    
    
    
    // Create something for the statusbar
    var statusDisplay : NSStatusItem? = nil
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Make an object of it and give it a variable length
        statusDisplay = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusDisplay?.title = "SMMTZC"
        
        // Create a simple drop dpwn menu for the display
        let dropMenu = NSMenu()
        dropMenu.addItem(NSMenuItem(title: "Options..", action: #selector(AppDelegate.optionWindow), keyEquivalent: "o"))
        dropMenu.addItem(NSMenuItem(title: "Quit SMMTZC", action: #selector(AppDelegate.quitApp), keyEquivalent: "q"))
        statusDisplay?.menu = dropMenu
        
        // Start a timer to keep updating the clock every 5 seconds
        var timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.updateClock), userInfo: nil, repeats: true)
    }
    
    // functions for getting and displaying the time, quitting app
    func updateClock() {
        
        let currentDate = Date()
        //Indo time
        let indoTime = DateFormatter()
        indoTime.timeStyle = .short
        indoTime.dateFormat = "M/d h:mma"
        indoTime.timeZone = TimeZone(abbreviation: "WIB")
        //NC time
        let carolinaTime = DateFormatter()
        carolinaTime.timeStyle = .short
        carolinaTime.dateFormat = "M/d h:mma"
        carolinaTime.timeZone = TimeZone(abbreviation: "EST")
        // set the display
        statusDisplay?.title = "ID: \(indoTime.string(from: currentDate)) || NC: \(carolinaTime.string(from: currentDate))"
    }
    func optionWindow() {
        optionsWindow.showWindow(Any?)
    }
    func quitApp() {
        NSApplication.shared().terminate(self)
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    

    
}

