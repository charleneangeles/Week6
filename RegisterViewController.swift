//
//  RegisterViewController.swift
//  
//
//  Created by Charlene Angeles on 10/8/17.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var btnRegister: UIButon!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnRegister_TouchUpInside(_ sender: Any){
        if let email = txtEmail.text, let password = txtPassword.text
        
        {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if user !=nil{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "register") //will change to different screen later on
                    self.present(vc!, animated: true, completion:nil)
                }
                else{
                    let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertController.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){(result: UIAlertAction) -> Void in print ("OK")}
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion:nil)
                        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
