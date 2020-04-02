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

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        statusBarItem.button?.title = "SMMTZ"

        let statusBarMenu = NSMenu(title: "SMMTZ Menu Bar")
        statusBarItem.menu = statusBarMenu

        // options not implemented yet
        statusBarMenu.addItem(
            withTitle: "Options..",
            action: #selector(AppDelegate.smmtzOptions),
            keyEquivalent: "O")

        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.smmtzQuit),
            keyEquivalent: "Q")
        
        
    // timer that updates clock display every 2 seconds
    // is there a better way to do this than a timer
    // calling clockDisplay() over and over again?
        
        clockTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(clockDisplay), userInfo: nil, repeats: true)
    
    }


    @objc func smmtzOptions() {
        print("Options menu here!")
    }


    @objc func smmtzQuit() {
        print("TIME IS A HUMAN CONSTRUCT")
        NSApplication.shared.terminate(self)
    }
   
  // this is the actual clock display
  // currently hard coded to show time in Jakarta
  // TODO: Make this dynamic, user selectable!
    
    @objc func clockDisplay() {
        let indoTime = DateFormatter()
        indoTime.timeZone = TimeZone(abbreviation: "ICT")
        indoTime.timeStyle = .short
        statusBarItem.button?.title = "Indonesia: \(indoTime.string(from:Date()))"
     }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

