

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
=======
>>>>>>> Stashed changes

>>>>>>> origin/master

class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
 
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var iconClick : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.underlined()
        passwordField.underlined()
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
        iconClick = true
    
        
=======
>>>>>>> Stashed changes
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    

>>>>>>> origin/master
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // Facebook login button tapped
    @IBAction func facebookLogin(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            // Error handling
            if error != nil {
                print("LUIS: Unable to authenticate with facebook")
            } else if result?.isCancelled == true {
                print("User cancelled Facebook Authentication")
            } else {
    
                // Gets credential from Access token from firebase
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)    
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth (_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
            print("Unable to authenticate with Firebase")
            } else {
                self.completeSignIn()
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwdField = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwdField, completion: { (user, error) in
                if error == nil {
                    self.completeSignIn()
                    
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwdField, completion: { (user, error) in
                        if error != nil {
                            print("Unable to auth with Firebase")
                        } else {
                            print("Successfully auth with Firebase")
                        }
                    })
                }
            })
        }
    }
    
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
    
    @IBAction func googleButtontapped(_ sender: Any) {
=======
>>>>>>> Stashed changes
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("error with Google Sign In \(error.localizedDescription)")
            return
        }
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!, accessToken: (authentication?.accessToken)!)
        
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            return
            print("Logged in with Google")
            
        })
    }

    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("error with Google Log Out \(error.localizedDescription)")
            return
        }
    }
    
    func completeSignIn() {
        performSegue(withIdentifier: "feed", sender: nil)
>>>>>>> origin/master
        
    }
    
    
    @IBAction func textSecured(_ sender: UIButton) {
        if(iconClick == true) {
            passwordField.isSecureTextEntry = false
            iconClick = false
            sender.isSelected = true
            
        } else {
            passwordField.isSecureTextEntry = true
            iconClick = true
            sender.isSelected = false
        }
    }
    
    
    func completeSignIn() {  performSegue(withIdentifier: "feed", sender: nil)  }
}






