//
//  PageViewController.swift
//  ProfileViewForm
//
//  Created by Keith Gapusan on 27/09/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
public protocol PageViewDelegate {
    func didUpdatePageView(sender: Int)
    func getNumberOfViews(sender: Int)
}

class PageViewController: UIPageViewController {
    var pageDelegate: PageViewDelegate!
    var backgroundColorList =  [UIColor]()
    var currentViewIndex : Int = 0
    let   pageControl: UIPageControl = {
        let pageController = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        pageController.currentPage = 0
        return pageController
    }()
    
    var orderedViewControllers = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        print("didload")
    }
    override func viewDidAppear(_ animated: Bool) {
        setCurrentView(index: currentViewIndex)
         configurePageControl()
        print("didappear \(currentViewIndex)")
    }
    
    
    func setOrderedViewController(_ listViewController : [UIViewController]){
        self.orderedViewControllers = listViewController
    }
    func setCurrentView(index : Int){
        print("set curr  = \(index)")
        print("set curr  = \(orderedViewControllers)")
        switch index {
        case 0:
           
           let vc = orderedViewControllers[index] as! CompleteProfilePage1
            setViewControllers([vc],
                               direction: .forward,
                               animated: true,
                               completion:{(value:Bool) in
                                print("completed 0\(value)")
                                if value {
                                    self.pageDelegate.didUpdatePageView(sender: index)
                                    vc.setBackgroundColor(color: self.backgroundColorList[index])
                                }
                                
            })
        case 1:
            
            let vc = orderedViewControllers[index] as! CompleteProfilePage2
            setViewControllers([vc],
                               direction: .forward,
                               animated: true,
                               completion:{(value:Bool) in
                            
                                if value {
                                    self.pageDelegate.didUpdatePageView(sender: index)
                                    vc.setBackgroundColor(color: self.backgroundColorList[index])
                                }
                                
            })
        case 2:
            
            let vc = orderedViewControllers[index] as! CompleteProfilePage3
            setViewControllers([vc],
                               direction: .forward,
                               animated: true,
                               completion:{(value:Bool) in
                               
                                if value {
                                    self.pageDelegate.didUpdatePageView(sender: index)
                                    vc.setBackgroundColor(color: self.backgroundColorList[index])
                                }
                                
            })
        case 3:
            
            let vc = orderedViewControllers[index] as! CompleteProfilePage4
            setViewControllers([vc],
                               direction: .forward,
                               animated: true,
                               completion:{(value:Bool) in
                    
                                if value {
                                    self.pageDelegate.didUpdatePageView(sender: index)
                                    vc.setBackgroundColor(color: self.backgroundColorList[index])
                                }
                                
            })
        default:
            print("not listed")
        }

        
    }
    func setBackgroundColorList(_ listBackground: [UIColor]){
        self.backgroundColorList = listBackground
    }
    func setCurrentIndex(index : Int){
        self.currentViewIndex = index
        
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = self.currentViewIndex
        
        self.view.addSubview(pageControl)
    }
    func getCurrentView() -> Int{
        return self.pageControl.currentPage
    }
    func nextPage(index:Int){
        //     let view = self.orderedViewControllers[index]
        self.setViewControllers(self.orderedViewControllers,
                                direction: .forward,
                                animated: true,
                                completion: nil)
    }

}

extension PageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
       
        switch orderedViewControllers.index(of: pageContentViewController)! {
        case 0:
             let vc = pageContentViewController as! CompleteProfilePage1
             vc.setBackgroundColor(color: self.backgroundColorList[orderedViewControllers.index(of: pageContentViewController)!])
             self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
             self.pageDelegate.didUpdatePageView(sender: self.pageControl.currentPage)
        case 1:
            let vc = pageContentViewController as! CompleteProfilePage2
            vc.setBackgroundColor(color: self.backgroundColorList[orderedViewControllers.index(of: pageContentViewController)!])
            self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
            self.pageDelegate.didUpdatePageView(sender: self.pageControl.currentPage)
        case 2:
            let vc = pageContentViewController as! CompleteProfilePage3
            vc.setBackgroundColor(color: self.backgroundColorList[orderedViewControllers.index(of: pageContentViewController)!])
            self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
            self.pageDelegate.didUpdatePageView(sender: self.pageControl.currentPage)
        case 3:
            let vc = pageContentViewController as! CompleteProfilePage4
            vc.setBackgroundColor(color: self.backgroundColorList[orderedViewControllers.index(of: pageContentViewController)!])
            self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
            self.pageDelegate.didUpdatePageView(sender: self.pageControl.currentPage)
        default:
            print("wala")
        }
        
       
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
         self.pageDelegate.didUpdatePageView(sender: previousIndex)
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        self.pageDelegate.didUpdatePageView(sender: nextIndex)
        return orderedViewControllers[nextIndex]
    }
    
}
