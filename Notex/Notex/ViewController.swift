//
//  ViewController.swift
//  Notex
//
//  Created by Peter Pham on 2023-05-04.
//

import UIKit
import PencilKit

class ViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {
    var toolPicker: PKToolPicker!

    @IBOutlet weak var canvasView: PKCanvasView!
    @IBOutlet weak var pencilFingerButton: UIBarButtonItem!
    
    // standard iPad portrait width
    let canvasWidth: CGFloat = 768
    let canvasOverscrollHeight: CGFloat = 500

    // for storing drawings
    var drawing = PKDrawing()
    
    
    override func viewWillAppear(_ animated: Bool) {
        // init canvasView with view controller
        canvasView.delegate = self
        canvasView.drawing = drawing
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput // let finger
        
        // Set up the tool picker
        if #available(iOS 14.0, *) {
            toolPicker = PKToolPicker()
        } else {
            // Set up the tool picker, using the window of our parent because our view has not
            // been added to a window yet.
            let window = parent?.view.window
            toolPicker = PKToolPicker.shared(for: window!)
        }
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func saveToCameraRoll(_ sender: Any) {
    }
    
}

