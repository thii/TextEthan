// ViewController.swift
//
// Copyright (c) 2014 Doan Truong Thi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var firstNameField: UITextField!
  @IBOutlet var lastNameField: UITextField!
  @IBOutlet var signInButton: UIButton!
  @IBOutlet var tapToChatButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    tapToChatButton.hidden = true
    
    if NSUserDefaults.standardUserDefaults().objectForKey("signedIn") != nil {
      firstNameField.hidden = true
      lastNameField.hidden = true
      signInButton.hidden = true
      tapToChatButton.hidden = false
      
      signInButton.enabled = false
    }
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  @IBAction func nameChanged(sender: AnyObject) {
    
    if (countElements(firstNameField.text) > 0) && (countElements(lastNameField.text) > 0) {
      signInButton.enabled = true
    } else {
      signInButton.enabled = false
    }
  }
  
  @IBAction func signIn(sender: AnyObject) {
    SKTUser.currentUser().firstName = firstNameField.text
    SKTUser.currentUser().lastName = lastNameField.text
    
    tapToChatButton.hidden = false
    firstNameField.hidden = true
    lastNameField.hidden = true
    signInButton.hidden = true
    
    NSUserDefaults.standardUserDefaults().setObject(NSNumber(bool: true), forKey: "signedIn")
    NSUserDefaults.standardUserDefaults().synchronize()
    
    SupportKit.track("Signed In")
    SupportKit.show()
  }

  @IBAction func showMessages(sender: AnyObject) {
    
    SupportKit.track("Tap to Chat")
    SupportKit.show()
  }
}
