//
//  RearwardableViewController.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

public protocol RearwardableViewController: UIViewController {
    func navigationShouldPopOnBackButton() -> Bool
    func navigationShouldPopOnInteractivePopGesture() -> Bool
}
