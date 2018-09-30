//
//  ProfileFormHolderViewController.swift
//  ProfileViewForm
//
//  Created by Keith Gapusan on 27/09/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit

class ProfileFormHolderViewController: UIViewController {

  
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "page1"),
                self.newVc(viewController: "page2"),
                self.newVc(viewController: "page3"),
                self.newVc(viewController: "page4")]
    }()
    



    
    lazy var backgroundList : [UIColor] =  {
        return [UIColor.cyan, UIColor.blue , UIColor.brown, UIColor.darkGray]
    }()
    
    var w : PageViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        w = self.childViewControllers[0] as?  PageViewController
        w.pageDelegate = self
        w.setCurrentIndex(index: 0)
        w.setBackgroundColorList(backgroundList)
        w.setOrderedViewController(orderedViewControllers)
//        w.setViewController(views: orderedViewControllers)
//        w.setImageList(images:  imageListName)
//        w.setDescList(descriptions: descriptionList)
        
     
        
     
    }

    func newVc(viewController: String) -> UIViewController {
       
        switch viewController {
        case "page1":
            return  UIStoryboard(name: "CompleteProfile", bundle: nil).instantiateViewController(withIdentifier: viewController) as! CompleteProfilePage1
        case "page2":
            return  UIStoryboard(name: "CompleteProfile", bundle: nil).instantiateViewController(withIdentifier: viewController) as! CompleteProfilePage2
        case "page3":
            return  UIStoryboard(name: "CompleteProfile", bundle: nil).instantiateViewController(withIdentifier: viewController) as! CompleteProfilePage3
        case "page4":
            return  UIStoryboard(name: "CompleteProfile", bundle: nil).instantiateViewController(withIdentifier: viewController) as! CompleteProfilePage4
        default:
            return  UIStoryboard(name: "CompleteProfile", bundle: nil).instantiateViewController(withIdentifier: viewController) as! CompleteProfilePage1
        }
      
    }
    
    
    fileprivate func gotoMainStoryBoard() {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "root") as? ProfileFormHolderViewController
        {
            
            present(vc, animated: true, completion: nil)
        }
    }
    
}

extension ProfileFormHolderViewController: PageViewDelegate{
    func didUpdatePageView(sender: Int) {
     }
    
    func getNumberOfViews(sender: Int) {
        print("getNumberOfViews \(sender)")
    }
    
    
}
