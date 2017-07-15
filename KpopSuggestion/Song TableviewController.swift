//
//  Song TableviewController.swift
//  KpopSuggestion
//
//  Created by Justin Artis on 6/14/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import Firebase

class Song_TableviewController: UITableViewController {

    var songList: [Song] = [Song]()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FirebaseApp.configure()
        
        ref = Database.database().reference()
        //getSongList()
        //self.keyList = Array(songList.keys)
        //print(self.songList.keys.count)

        
        
//        var kissMe = Song(song: "Kiss Me", album: "Pinncchio", artist: "Zion.T", image: UIImage(named: "kiss_me_image")!)
//        var kissMe2 = Song(song: "Kiss Me", album: "Pinncchio", artist: "Zion.T", image: UIImage(named: "kiss_me_image")!)


        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func getSongList() -> Void {
        ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
            print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                var keyList = [String]()
                keyList = Array(dictionary.keys)
                for object in keyList {
                   var songInfo = dictionary[object]
                   //print(songInfo?["album"])
                    //print(songInfo["album"])
                    var song = Song(song: songInfo?["song"] as! String, album: songInfo?["album"] as! String, artist: songInfo?["artist"] as! String, image: songInfo?["imageURL"] as! String)
                    self.songList.append(song)
                    self.tableView.insertRows(at: [IndexPath(row: self.songList.count-1, section: 0)], with: UITableViewRowAnimation.automatic)
                }
            }
            //print("one")
            
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
