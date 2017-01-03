//
//  AppMethods.swift
//  DHCC_iOS
//
//  Created by Ayman Ibrahim Abdel Alim on 12/4/16.
//  Copyright © 2016 LinkDev. All rights reserved.
//

import UIKit
import Kingfisher
import Localize_Swift

enum FontType:String
{
    case FontRegular = "Apercu-Regular"
    case FontBold = "Apercu-Bold"
    case FontLight = "Apercu-Light"
}

func getFontOfSize(size:CGFloat, type:FontType)->UIFont
{
    return UIFont(name: type.rawValue, size: size)!
}

func setImageOfUrlStrNoPlaceHolder(str:String, imageV:UIImageView)
{
    if let url = URL(string: str)
    {
        let resource = ImageResource(downloadURL: url, cacheKey: nil)
        imageV.kf.indicatorType = .activity
        imageV.kf.setImage(with: resource, placeholder: nil, options: [.transition(ImageTransition.fade(0.5))], progressBlock: nil, completionHandler: nil)
    }
}

func presentVCCircularly(fromVC:UIViewController, toVC:UIViewController, initialRect:CGPoint)
{
    let seg = OHCircleSegue(identifier: "segIdent", source: fromVC, destination: toVC)
    seg.circleOrigin = initialRect
    seg.perform()
}

func printFonts()
{
    let fontFamilyNames = UIFont.familyNames
    for familyName in fontFamilyNames
    {
        print("------------------------------")
        print("Font Family Name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("Font Names = [\(names)]")
    }
}

func makeBottomBorderFor(textField:UITextField) {
    let border = CALayer()
    let width = CGFloat(0.6)
    border.borderColor = UIColor.init(red: 7.0/255.0, green: 91.0/255.0, blue: 124.0/255.0, alpha: 1.0).cgColor
    
    border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
    
    border.borderWidth = width
    
    textField.layer.addSublayer(border)
    textField.layer.masksToBounds = true
}

func isArabicCurrentLanguage()->Bool
{
    return Localize.currentLanguage() == "ar"
}

func formate(dateString : String) -> String {
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: dateString)
    dateFormatter.dateFormat = "d MMM, yyyy"
    
    if (date != nil) {
       return dateFormatter.string(from: date!)
    } else {
        return ""
    }
    
}

func showAlert(title:String, message:String, vc:UIViewController, closure:(()->())?)
{
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    let okAction = UIAlertAction(title: "OK".localized(), style: UIAlertActionStyle.default)
    { (result : UIAlertAction) -> Void in
        closure?()
    }
    alertController.addAction(okAction)
    vc.present(alertController, animated: true, completion: nil)
}

func showYesNoAlert(title:String, message:String, vc:UIViewController, closure:((Bool)->())?)
{
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    let okAction = UIAlertAction(title: "OK".localized(), style: UIAlertActionStyle.default)
    { (result : UIAlertAction) -> Void in
        closure?(true)
    }
    let cancelAction = UIAlertAction(title: "CANCEL".localized(), style: UIAlertActionStyle.default)
    { (result : UIAlertAction) -> Void in
        closure?(false)
    }
    alertController.addAction(cancelAction)
    alertController.addAction(okAction)
    vc.present(alertController, animated: true, completion: nil)
}

func openExternalURL(details: String, vc:UIViewController)
{
    let application = UIApplication.shared
    if let url = URL(string: details)
    {
        if application.canOpenURL(url)
        {
            application.openURL(url)
        }
        else
        {
            showAlert(title: "", message: "SOMETHING_WENT_WRONG".localized(), vc: vc, closure: nil)
        }
    }
    else
    {
        showAlert(title: "", message: "SOMETHING_WENT_WRONG".localized(), vc: vc, closure: nil)
    }
}
