//
//  LivePagesVC.swift
//  unsober.
//
//  Created by Cody Philipp on 23/6/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit

class LivePagesVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    // Variables
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewC(viewController: "LiveData"),
                self.newViewC(viewController: "Live"),
                self.newViewC(viewController: "LiveLarry")]
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        let firstViewController = orderedViewControllers[1]
        setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        
    }
    
    func newViewC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard orderedViewControllers.count > previousIndex else { return nil }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard orderedViewControllers.count != nextIndex else { return nil }
        guard orderedViewControllers.count > nextIndex else { return nil }
        
        return orderedViewControllers[nextIndex]
    }

}
