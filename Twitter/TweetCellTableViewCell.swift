//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Mac mini on 16.02.21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    
    var favorited: Bool = false
    var tweetId:Int = -1
    
    
    @IBAction func favTweet(_ sender: Any) {
        
        let tobeFavourited = !favorited
        if(tobeFavourited){
            TwitterAPICaller.client?.favouriteTweet(tweetId: tweetId, success: {
                self.setFavourite(true)
            }, failure: { (error) in
                print ("Favourite id not succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavouriteTweet(tweetId: tweetId, success: {
                self.setFavourite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
        
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Eror is retweeting: \(error)")
        })
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    func setFavourite (_ isFavourited: Bool){
        
        favorited = isFavourited
        print(favorited)
        if (favorited){
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon-1"), for: UIControl.State.normal)

        }
    } 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
