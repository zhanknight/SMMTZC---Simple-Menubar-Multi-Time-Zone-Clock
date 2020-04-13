//
//
//  SimpleMenubarClock2
//  Created by zhanknight
//
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var clockTimer: Timer?
    var selectedZone = "SMMTZ"

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.variableLength)
        statusBarItem.button?.title = selectedZone
        
        let statusBarMenu = NSMenu()
        let subOptionsMenu = NSMenu()
        let mainOptionsMenu = NSMenuItem(title: "Zones", action: nil, keyEquivalent: "")
        statusBarMenu.addItem(mainOptionsMenu)
        statusBarMenu.setSubmenu(subOptionsMenu, for: mainOptionsMenu)

        // on clicking these options, need to set the timezone abbreviation (using the keyEquivalent to hold time string) and pass to clockdisplay() -> probably a better way to pass args
        // Okay this is obviously not ideal, need to switch to using UST and build some kind of automatic DST check/adjust
        // is there a library out there I can import to allow searching geographically and grabbing appropriate UST offset?
        // leaving like this for now
        subOptionsMenu.addItem(NSMenuItem(title: "Indonesia", action: #selector(setNewZone), keyEquivalent: "ICT"))
        subOptionsMenu.addItem(NSMenuItem(title: "New Mexico", action: #selector(setNewZone), keyEquivalent: "MST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Korea", action: #selector(setNewZone), keyEquivalent: "KST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "CST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "BST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "UZT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "MSK"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "BST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "CVY"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "ART"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "EDT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "CDT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "CST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "PDT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "HST"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Test", action: #selector(setNewZone), keyEquivalent: "GMT"))
        subOptionsMenu.addItem(NSMenuItem(title: "Euro", action: #selector(setNewZone), keyEquivalent: "CEST"))
        
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.smmtzQuit),
            keyEquivalent: "Q")
        
    // timer that updates clock display every 2 seconds
    // is there a better way to do this than a timer
    // calling clockDisplay() over and over again?
        clockTimer = Timer.scheduledTimer(timeInterval: 2, target: self,selector: #selector(clockDisplay), userInfo: nil, repeats: true)
    }
   
    
    @objc func setNewZone( sender : NSMenuItem ) {
        selectedZone = sender.keyEquivalent
    }
    
    @objc func clockDisplay() {
        if selectedZone == "SMMTZ" {
            selectedZone = "Choose Timezone.."
            statusBarItem.button?.title = selectedZone
        }   else if selectedZone == "Choose Timezone.." {
            selectedZone = "SMMTZ"
            statusBarItem.button?.title = selectedZone
        }
            else {
                let time = DateFormatter()
                time.timeZone = TimeZone(abbreviation: selectedZone)
                time.timeStyle = .short
                statusBarItem.button?.title = "\(selectedZone): \(time.string(from:Date()))"
     }
    }
    
    @objc func smmtzQuit() {
           print("TIME IS A HUMAN CONSTRUCT")
           NSApplication.shared.terminate(self)
       }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
}

