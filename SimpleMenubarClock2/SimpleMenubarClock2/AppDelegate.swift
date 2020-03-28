//
//  AppDelegate.swift
//  SimpleMenubarClock2
//
//  Created by Zhan Knight on 3/27/20.
//  Copyright © 2020 Zhan Knight. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        statusBarItem.button?.title = "SMMTZ"

        let statusBarMenu = NSMenu(title: "SMMTZ Menu Bar")
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Options..",
            action: #selector(AppDelegate.smmtzOptions),
            keyEquivalent: "")

        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.smmtzQuit),
            keyEquivalent: "")
    }


    @objc func smmtzOptions() {
        print("Options menu here!")
    }


    @objc func smmtzQuit() {
        print("TIME IS A HUMAN CONSTRUCT")
        NSApplication.shared.terminate(self)
    }

    // this is the old Swift 3 code I wrote while serving in Peace Corps Indonesia
    // TODO rewrite in Swift 5 and make better
   // func updateClock() {
   //
   //     let currentDate = Date()
   //     //Indo time
   //     let indoTime = DateFormatter()
   //     indoTime.timeStyle = .short
   //     indoTime.dateFormat = "M/d h:mma"
   //     indoTime.timeZone = TimeZone(abbreviation: "WIB")
   //     //NC time
   //     let carolinaTime = DateFormatter()
   //     carolinaTime.timeStyle = .short
   //     carolinaTime.dateFormat = "M/d h:mma"
   //     carolinaTime.timeZone = TimeZone(abbreviation: "EST")
   //     // set the display
   //     statusDisplay?.title = "ID: \(indoTime.string(from: currentDate)) || NC: \(carolinaTime.string(from: currentDate))"
   //  }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

