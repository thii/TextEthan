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
