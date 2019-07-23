//
//  ManageBookVC.swift
//  Reading List
//
//  Created by Spencer Curtis on 7/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ManageBookVCDelegate {
	func passBookDetails(title: String, reasonRead reason: String)
}

class ManageBookVC: UIViewController {

	@IBOutlet weak var titleTextfield: UITextField!
	@IBOutlet weak var reasonTextView: UITextView!
	
	var delegate: ManageBookVCDelegate?
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

	@IBAction func saveBtnAction(_ sender: Any) {
		guard let title = titleTextfield.optionalText, let reason = reasonTextView.text else { return }
		
		delegate?.passBookDetails(title: title, reasonRead: reason)
	}
	
}

