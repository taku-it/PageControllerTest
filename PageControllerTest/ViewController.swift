//
//  ViewController.swift
//  PageControllerTest
//
//  Created by 生田拓登 on 2021/05/13.
//

import UIKit

class ViewController: UIPageViewController {

    var pageViewControllers: [UIViewController] = []
    var nowPage: Int = 0
    
    var currentPage: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        let firstView = storyboard?.instantiateViewController(identifier: "FirstVC") as! FirstViewController
        let secondView = storyboard?.instantiateViewController(identifier: "SecondVC") as! SecondViewController
        let thirdView = storyboard?.instantiateViewController(identifier: "ThirdVC") as! ThirdViewController
        pageViewControllers = [firstView, secondView, thirdView]
        
        self.setViewControllers([pageViewControllers[0]], direction: .forward, animated: true, completion: nil)
       
    }
    

  
}

extension ViewController: UIPageViewControllerDelegate{
    
}

extension ViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == 0 {
            return nil
        }else{
            return pageViewControllers[index! - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = pageViewControllers.firstIndex(of: viewController)
        if index == pageViewControllers.count - 1{
            return nil
        }else{
            return pageViewControllers[index! + 1]
        }
        
    }
    
    //    全ページ返すメソッド
        func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return pageViewControllers.count
        }
        
    //    現在のページを返すメソッド
        func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            return currentPage
        }
    
    
    
}
