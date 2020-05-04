//
//  ViewController.swift
//  DarkLight Mode
//
//  Created by Noah Evans on 01/05/2020.
//  Copyright © 2020 Velocity Apps. All rights reserved.
//

import Cocoa
import Automator

class ViewController: NSViewController {


    @IBOutlet weak var statusDisplay: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        statusDisplay.stringValue = String("")
        // Do any additional setup after loading the view.
    }
    
    //MENU BAR

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func onChangeMode(_ sender: Any) {
        statusDisplay.stringValue = String("Changing the system theme...")
        guard let workflowPath = Bundle.main.path(forResource: "script", ofType: "workflow") else {
                print("Workflow resource not found")
            statusDisplay.stringValue = String("The app's installation is corrupt. Please install again.")
                return
            }

            let workflowURL = URL(fileURLWithPath: workflowPath)
            do {
                try AMWorkflow.run(at:workflowURL, withInput: nil)
                statusDisplay.stringValue = String("Changed the system theme.")
            } catch {
                print("Error running workflow: \(error)")
                statusDisplay.stringValue = String("The app's installation is corrupt. Please install again.")
            }
        }
    }
    

