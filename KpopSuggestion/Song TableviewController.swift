//
//  Song TableviewController.swift
//  KpopSuggestion
//
//  Created by Justin Artis on 6/14/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class Song_TableviewController: UITableViewController {

    var songList: [Song] = [Song]()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseApp.configure()
        
        ref = Database.database().reference()

        let scrollPoint = CGPoint(x: 0, y: self.tableView.contentSize.height - self.tableView.frame.size.height)
        self.tableView.setContentOffset(scrollPoint, animated: true)
        //let storageRef = Storage.reference(forURL: "gs://kpopsuggestionapp.appspot.com")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func getSongList() -> Void {
        ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                let storageRef = StorageReference()
                var keyList = [String]()
                keyList = Array(dictionary.keys)
                for object in keyList {
                   var songInfo = dictionary[object]
                   var url = object + ".jpg"
                    var song = Song(song: songInfo?["song"] as! String, album: songInfo?["album"] as! String, artist: songInfo?["artist"] as! String, image: storageRef.child(url).fullPath )
                    self.songList.append(song)
                    self.tableView.insertRows(at: [IndexPath(row: self.songList.count-1, section: 0)], with: UITableViewRowAnimation.automatic)
                }
            }
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getSongList()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
// #warning Incomplete implementation, return the number of rows
        return songList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongTableCell
        cell.artistLabel.text = songList[indexPath.row].getArtist()
        //cell.albumImage.image =
        cell.albumLabel.text = songList[indexPath.row].getAlbum()
        cell.songLabel.text = songList[indexPath.row].getSong()
        var cellStorage = songList[indexPath.row].albumImage
        //imageRef.data
        print(cell.artistLabel.text)
        let storageRef = StorageReference().child(cellStorage)
        // Download the data, assuming a max size of 1MB (you can change this as necessary)
        storageRef.getData(maxSize: 1*1024*1024) { (data, error) -> Void in
            let pic  = UIImage(data: data!)
            cell.albumImage.image = pic
        }
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
