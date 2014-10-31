import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var firstNameField: UITextField!
  @IBOutlet var lastNameField: UITextField!
  @IBOutlet var signInButton: UIButton!
  @IBOutlet var signInView: UIView!
  @IBOutlet var infoView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if infoView != nil {
      infoView.hidden = true
    }
    
    if NSUserDefaults.standardUserDefaults().objectForKey("signedIn") != nil {
      infoView.hidden = false
      signInView.hidden = true
      signInButton.hidden = true

      SupportKit.show()
    }
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  @IBAction func nameChanged(sender: AnyObject) {
  }
  
  @IBAction func signIn(sender: AnyObject) {
  }

  @IBAction func showMessages(sender: AnyObject) {
  }

  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
