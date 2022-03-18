//
//  TweetViewController.swift
//  Twitter
//
//  Created by Ola Ogunsanya on 3/12/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var text: UITextView!

    //tweets created tweets
    //posts them to feed once  them
    @IBAction func Tweet(_ sender: Any) {
        if (!text.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: text.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure : { (error) in
                print("Erorr posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
