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
    var tzName: String = "SMMTZ"

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
        
        let tzList = TimeZone.abbreviationDictionary

        tzList.forEach { key, value in
            subOptionsMenu.addItem(NSMenuItem(title: "\(value)", action: #selector(setNewZone), keyEquivalent: "\(key)"))
        }
        
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
        tzName = sender.title
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
                statusBarItem.button?.title = "\(tzName): \(time.string(from:Date()))"
     }
    }
    
    @objc func smmtzQuit() {
           print("TIME IS A HUMAN CONSTRUCT")
           NSApplication.shared.terminate(self)
       }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
