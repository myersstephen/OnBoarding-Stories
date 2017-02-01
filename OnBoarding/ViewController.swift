//
//  ViewController.swift
//  OnBoarding
//
//  Created by stephen myers on 12/2/16.
//  Copyright © 2016 Stephen Myers. All rights reserved.
//

import UIKit
import PaperOnboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var getStartedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
    
    }

    func onboardingItemsCount() -> Int {
        //number of screens 
        return 11
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        //this is how the entire onboarding screen is put together
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 250/255, green: 200/255, blue: 0/255, alpha: 1)
        
        //explicitly unwrapped should consider checking if font is available first if using imported fonts. If not available have a backup font. check iosfonts.com for fonts.
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return[("curly", "A love Story!", "There was a beautiful woman who had curly hair, stunning eyes and was very kind.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
               
               ("Guy_1", "Shortly After...", "A dashing guy came into the picture. He wanted to be friends with the beautiful woman.", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
               
               ("Two_picture", "Eventually", "They realized they liked each other and started a relationship.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
            
                ("ring-1", "Marriage", "They got married but they didnt expect what came next.", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Stormy_Days", "Stormy Days", "Over the next two years their marriage would  have many ups and downs, arguments and tough times. They lost family and almost lost family, many changes were made.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Guy_2", "He Struggled", "He tried to maintain an optimistic outlook but sometimes life got the best of him. Many times he acted like a baby.", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Side_Face", "She was still sweet", "She was still loving and patient even through those difficult times.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Striaght_hair", "After Some Time", "Things got better, She reminded him of when they first met.", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Heavenly", "Heavenly Help", "With friends, family and some heavenly help they managed to get back on track.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Two_picture", "Happily Ever After", "He and her lived happily ever after", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descriptionFont),
                
                ("Beard", "One More Thing", "", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 9 {
            
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }
            
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        //if reach the last page in index
        
        if index == 10 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }
    
    @IBAction func gotStarted(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboardingComplete")
        
        userDefaults.synchronize()
    }
    


}

