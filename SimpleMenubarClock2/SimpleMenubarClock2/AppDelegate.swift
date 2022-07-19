//
//
//  SimpleMenubarClock2
//  Created by Zhan Knight
//
//
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusBarItem: NSStatusItem!
    private var clockTimer: Timer?
    private var selectedZone = "SMMTZ"
    private var tzName: String = "SMMTZ"

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
            statusBarItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
            statusBarItem.button?.title = selectedZone
        let statusBarMenu = NSMenu()
        let subOptionsMenu = NSMenu()
        let mainOptionsMenu = NSMenuItem(title: "Zones", action: nil, keyEquivalent: "")
            statusBarMenu.addItem(mainOptionsMenu)
            statusBarMenu.setSubmenu(subOptionsMenu, for: mainOptionsMenu)
    // get all possible time zones
        let tzList = TimeZone.abbreviationDictionary
    // iterate over time zones and add menu item for each
            tzList.forEach { key, value in
                subOptionsMenu.addItem(NSMenuItem(title: "\(value)", action: #selector(setNewZone), keyEquivalent: ""))
            }
    // add a quit button that kills the app
            statusBarItem.menu = statusBarMenu
                statusBarMenu.addItem(withTitle: "Quit", action: #selector(AppDelegate.smmtzQuit), keyEquivalent: "Q")
    // timer that updates clock display every 2 seconds
            clockTimer = Timer.scheduledTimer(timeInterval: 2, target: self,selector: #selector(clockDisplay), userInfo: nil, repeats: true)
            }
    // func to handle time zone menu changes
    @objc func setNewZone( sender : NSMenuItem) {
        selectedZone = sender.title
        tzName = sender.title
    }
    // func that handles what to display on clock from initial open to zone selection
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
                time.timeZone = TimeZone(identifier: selectedZone)
                time.timeStyle = .short
                statusBarItem.button?.title = "\(tzName): \(time.string(from:Date()))"
        }
        }
    // the quit func
    @objc func smmtzQuit() {
           print("TIME IS A HUMAN CONSTRUCT")
           NSApplication.shared.terminate(self)
       }
    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
