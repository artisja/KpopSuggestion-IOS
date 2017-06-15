//
//  AddSongController.swift
//  KpopSuggestion
//
//  Created by Justin Artis on 6/15/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit

class AddSongController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var selectorButton: UIButton!
    @IBOutlet weak var inputedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showImagePicker(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(picker, animated: true) {
            
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            inputedImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
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
