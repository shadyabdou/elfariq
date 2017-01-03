//
//  ServerManagerExtensions.swift
//  DHCC_iOS
//
//  Created by Ayman Ibrahim Abdel Alim on 12/4/16.
//  Copyright © 2016 LinkDev. All rights reserved.
//

import UIKit


extension LoginRoot
{
    static var all = Resource<LoginRoot>(url: "\(MainURL)ManageAccount/Login", httpmethod: .post)
    { (json) -> LoginRoot? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = LoginRoot(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForLogin()->Resource<LoginRoot>
    {
        let url = "\(MainURL)ManageAccount/Login"
        LoginRoot.all.url = url
        return LoginRoot.all
    }
}

extension WorkspaceRootClass
{
    static var all = Resource<WorkspaceRootClass>(url: "\(MainURL)Workspace/RetrieveApplicantRequests", httpmethod: .post)
    { (json) -> WorkspaceRootClass? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = WorkspaceRootClass(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForWorkspace(subUrl:String)->Resource<WorkspaceRootClass>
    {
        let url = "\(MainURL)Workspace/\(subUrl)"
        WorkspaceRootClass.all.url = url
        return WorkspaceRootClass.all
    }
}


extension DepartmentServiceRoot
{
    static var all = Resource<DepartmentServiceRoot>(url: "\(MainURL)Common/ServiceCatalogue/GetDepartmentServices", httpmethod: .post)
    { (json) -> DepartmentServiceRoot? in
        
        let facilities = FacilitiesCatalogModel.sharedInstance.setObject(json: json)
        return facilities
    }
}

extension ForgetAndChangePasswordRootClass
{
    static var all = Resource<ForgetAndChangePasswordRootClass>(url: "\(MainURL)ManageAccount/SendForgetPassword", httpmethod: .post)
    { (json) -> ForgetAndChangePasswordRootClass? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = ForgetAndChangePasswordRootClass(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForForgetPassword()->Resource<ForgetAndChangePasswordRootClass>
    {
        let url = "\(MainURL)ManageAccount/SendForgetPassword"
        ForgetAndChangePasswordRootClass.all.url = url
        return ForgetAndChangePasswordRootClass.all
    }
    
    
    static func resourceForChangePassword()->Resource<ForgetAndChangePasswordRootClass>
    {
        let url = "\(MainURL)ManageAccount/ChangePassword"
        ForgetAndChangePasswordRootClass.all.url = url
        return ForgetAndChangePasswordRootClass.all
    }
}

extension ContactInfoRootClass
{
    static var all = Resource<ContactInfoRootClass>(url: ContactInfoURL, httpmethod: .post)
    { (json) -> ContactInfoRootClass? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = ContactInfoRootClass(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForContactInfo()->Resource<ContactInfoRootClass>
    {
        let url = ContactInfoURL
        ContactInfoRootClass.all.url = url
        return ContactInfoRootClass.all
    }
}

extension FeedbackRootClass
{
    static var all = Resource<FeedbackRootClass>(url: FeedbackURL, httpmethod: .post)
    { (json) -> FeedbackRootClass? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = FeedbackRootClass(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForFeedback()->Resource<FeedbackRootClass>
    {
        let url = FeedbackURL
        FeedbackRootClass.all.url = url
        return FeedbackRootClass.all
    }
}

extension LogoutRoot
{
    static var all = Resource<LogoutRoot>(url: "\(MainIP)ManageAccount/Logout", httpmethod: .post)
    { (json) -> LogoutRoot? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = LogoutRoot(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
}

extension NotificationRoot
{
    static var all = Resource<NotificationRoot>(url: "\(MainIP)GetAllApplicantNotifications/0/0", httpmethod: .get)
    { (json) -> NotificationRoot? in
        
        //print(json)
        if let jsonObj = json as? NSDictionary
        {
            let content = NotificationsModel.getInstance.setObject(json: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForNotifications(pageNumber:Int, pageSize:Int)->Resource<NotificationRoot>
    {
        let url = "\(MainIP)ManageAccount/GetAllApplicantNotifications/\(pageNumber)/\(pageSize)"
        NotificationRoot.all.url = url
        return NotificationRoot.all
    }
}

