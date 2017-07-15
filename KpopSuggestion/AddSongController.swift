//
//  AddSongController.swift
//  KpopSuggestion
//
//  Created by Justin Artis on 6/15/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import Darwin

class AddSongController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var selectorButton: UIButton!
    @IBOutlet weak var inputedImage: UIImageView!
    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var albumTextField: UITextField!
    @IBOutlet weak var submitSongButton: UIButton!
    
    
    
    var ref: DatabaseReference!
    var localPath: NSURL!
    var localURL: URL!
    var newSong = Song(song: "", album: "", artist: "", image: "")
    var randomInt : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        randomInt = Int(arc4random_uniform(UInt32(UInt32(Int32.max))))
        
       
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showImagePicker(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(picker, animated: true) {
            
        }
    }

    
    @IBAction func submitSong(_ sender: Any) {
        ref.child("\(randomInt)").setValue(newSong.artistName)
        let storage = Storage.storage()
        var storageRef = storage.reference()
        print()
        print()
        print()
        print(storageRef)
        storageRef.child("\(randomInt)" + ".jpg")
        //var data = NSData()
        //let metaData = StorageMetadata()
        //metaData.contentType = "image/jpg"
        // Data in memory
        // Create a reference to the file you want to upload
        let riversRef = storageRef.child("images/kiss_me_image.jpg")
        
        let metadata: StorageMetadata
        print()
        print()
        print()
        print(localURL.absoluteString)
        print()
        print()

        // Upload the file to the path "images/rivers.jpg"
        riversRef.putFile(from: localURL, metadata: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
      inputedImage.image =  info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
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
