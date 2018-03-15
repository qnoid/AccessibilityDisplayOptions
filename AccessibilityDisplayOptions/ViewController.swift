//
//  ViewController.swift
//  AccessibilityDisplayOptions
//
//  Created by Markos Charatzas on 15/3/18.
//  Copyright © 2018 qnoid. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var box: NSBox!
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(accessibilityDisplayShouldIncreaseContrast(_:)), name: NSWorkspace.accessibilityDisplayOptionsDidChangeNotification, object: NSWorkspace.shared)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(accessibilityDisplayShouldIncreaseContrast(_:)), name: NSWorkspace.accessibilityDisplayOptionsDidChangeNotification, object: NSWorkspace.shared)
    }
    
    @objc func accessibilityDisplayShouldIncreaseContrast(_ aNotification: NSNotification) {
        guard let workspace = aNotification.object as? NSWorkspace else {
            return
        }
        
        box.fillColor = workspace.accessibilityDisplayShouldIncreaseContrast ? NSColor.black : NSColor.white
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

