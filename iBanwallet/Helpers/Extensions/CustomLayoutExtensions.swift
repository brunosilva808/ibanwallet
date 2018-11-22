////
////  CustomLayoutProtocol.swift
////  SmartDrive
////
////  Created by Artem Umanets on 06/09/2018.
////  Copyright © 2018 Carbon by Bold. All rights reserved.
////
//
//import UIKit
//import SnapKit
//
//protocol CustomLayoutProtocol: class { }
//
//extension CustomLayoutProtocol where Self: UIViewController {
//
//    func appTitleLabel() -> UILabel {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.attributedText = AttributedTextHelper.appTitle
//        label.sizeToFit()
//        return label
//    }
//
//    @discardableResult
//    func addTitleNavigationBar() -> UIView {
//        let navBar = UIView()
//        self.view.addSubview(navBar);
//        navBar.backgroundColor = UIColor.clear
//
//        navBar.snp.makeConstraints({ (maker) in
//            maker.height.equalTo(UI.Layout.System.navigationBarHeight)
//            maker.width.equalTo(UI.Layout.System.screen.width)
//            maker.top.equalTo(UI.Layout.System.statusBarHeight)
//            maker.centerX.equalToSuperview()
//        })
//
//        let label = self.appTitleLabel()
//        navBar.addSubview(label)
//        label.snp.makeConstraints({ (maker) in
//            maker.edges.equalToSuperview()
//        })
//        return navBar
//    }
//
//    @discardableResult
//    func addFooter(below contentView: UIView) -> UIView {
//        let bottomConstraint = contentView.constraint(for: .bottom)
//        NSLayoutConstraint.deactivate([bottomConstraint])
//
//        let viewFooterHolder = UIView()
//        self.view.addSubview(viewFooterHolder)
//        viewFooterHolder.backgroundColor = Theme.Color.Primary.footer
//
//        viewFooterHolder.snp.makeConstraints {
//            $0.height.equalTo(60.0 + UI.Layout.System.safeLayoutInset.bottom)
//            $0.leading.trailing.bottom.equalToSuperview()
//        }
//
//        let footerImageView = UIImageView(image: #imageLiteral(resourceName: "IntroFooter"))
//        footerImageView.contentMode = .center
//        viewFooterHolder.addSubview(footerImageView);
//
//        footerImageView.snp.makeConstraints {
//            $0.size.equalTo(CGSize(width: 300.0, height: 40.0))
//            $0.top.equalToSuperview().offset(10.0)
//            $0.centerX.equalToSuperview()
//        }
//
//        contentView.snp.makeConstraints {
//            $0.bottom.equalTo(footerImageView.snp.top).offset(-bottomConstraint.constant)
//        }
//        return viewFooterHolder
//    }
//}
