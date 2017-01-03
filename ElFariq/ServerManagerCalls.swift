//
//  ServerManagerCalls.swift
//  DHCC_iOS
//
//  Created by Ayman Ibrahim Abdel Alim on 12/4/16.
//  Copyright © 2016 LinkDev. All rights reserved.
//

import UIKit
import OneSignal

extension ServerManager
{
    func login(un: String, pn: String)
    {
        OneSignal.idsAvailable
        { (userID, pushToken) in
            var deviceId = UIDevice.current.identifierForVendor?.uuidString.replacingOccurrences(of: "-", with: "")
            if pushToken != nil
            {
                deviceId = pushToken
            }
            let params = ["UserName":un, "PassWord":pn, "DeviceID":deviceId!, "MobileType" : 1] as [String : Any]
            self.httpConnect(resource: LoginRoot.resourceForLogin(), paramters: params, authentication: nil, complation:
                { (json, data) in
                    if let login = json
                    {
                        self.didFinish?(login as AnyObject?)
                    }
            })
            { (error, msg) in
                self.didFinishWithError?(error, msg)
            }
        }
    }
    
    func getWorkspaceRequests(pageNumber : Int)
    {
        if let sharedData = LoginModel.sharedData.loadUserData()
        {
            let params = ["UserType": sharedData.data?.applicantType! as Any , "PageNumber":pageNumber, "PageSize":10, "UserGUID" : sharedData.data?.iD! as Any, "RequestsType": 1] as [String : Any]
            httpConnect(resource: WorkspaceRootClass.resourceForWorkspace(subUrl:"RetrieveApplicantRequests"), paramters: params, authentication: sharedData.data?.accesstoken?.accessToken, complation:
                { (json, data) in
                    if let workspace = json
                    {
                        self.didFinish?(workspace as AnyObject?)
                    }
            })
            { (error, msg) in
                self.didFinishWithError?(error, msg)
            }
        }
    }
    
    func getWorkspaceDrafts(pageNumber : Int, pageSize:Int)
    {
        if let sharedData = LoginModel.sharedData.loadUserData()
        {
            let params = ["UserType": sharedData.data?.applicantType! as Any, "PageNumber":pageNumber, "PageSize":pageSize, "UserGUID" : sharedData.data?.iD! as Any, "RequestsType": 0] as [String : Any]
            httpConnect(resource: WorkspaceRootClass.resourceForWorkspace(subUrl:"RetrieveApplicantRequests"), paramters: params, authentication: sharedData.data?.accesstoken?.accessToken, complation:
                { (json, data) in
                    if let workspace = json
                    {
                        self.didFinish?(workspace as AnyObject?)
                    }
            })
            { (error, msg) in
                self.didFinishWithError?(error, msg)
            }
        }
    }
    
    func getWorkspaceTasks(pageNumber : Int) {
        
        if let sharedData = LoginModel.sharedData.loadUserData()
        {
            
            let params = ["UserType": sharedData.data?.applicantType! as Any, "PageNumber":pageNumber, "PageSize":10, "UserGUID" : sharedData.data?.iD! as Any] as [String : Any]
            httpConnect(resource: WorkspaceRootClass.resourceForWorkspace(subUrl:"RetrieveApplicantTasks"), paramters: params,authentication:  sharedData.data?.accesstoken?.accessToken, complation:
                { (json, data) in
                    if let workspace = json
                    {
                        self.didFinish?(workspace as AnyObject?)
                    }
            })
            { (error, msg) in
                self.didFinishWithError?(error, msg)
            }
        }
    }
    
    func getCategories(pageSize:Int, pageIndex:Int, departmentID:Int)
    {
        let params = ["PageSize":pageSize, "PageIndex":pageIndex, "DepartmentID":departmentID]
        httpConnect(resource: DepartmentServiceRoot.all, paramters: params, authentication: nil, complation:
            { (json, data) in
                if let categories = json
                {
                    self.didFinish?(categories as AnyObject?)
                }
        })
        { (error, msg) in
            self.didFinishWithError?(error, msg)
        }
    }
    
    func sendforgetPassword(email : String) {
        
        let params = ["Email": email] as [String : Any]
        httpConnect(resource: ForgetAndChangePasswordRootClass.resourceForForgetPassword(), paramters: params,authentication:  nil, complation:
            { (json, data) in
                if let forgetPassword = json
                {
                    self.didFinish?(forgetPassword as AnyObject?)
                }
        })
        { (error, msg) in
            self.didFinishWithError?(error, msg)
        }
        
    }
    
    func changePassword(oldPassword : String, newPassword: String) {
        
        if let sharedData = LoginModel.sharedData.loadUserData() {
            let params = ["OldPassword": oldPassword , "NewPassWord": newPassword] as [String : Any]
            httpConnect(resource: ForgetAndChangePasswordRootClass.resourceForChangePassword(), paramters: params,authentication: sharedData.data?.accesstoken?.accessToken, complation:
                { (json, data) in
                    if let changePasswordData = json
                    {
                        self.didFinish?(changePasswordData as AnyObject?)
                    }
            })
            { (error, msg) in
                self.didFinishWithError?(error, msg)
            }
        }
    }
    
    func getContactInfo() {
        
        
            let params = ["AppLanguage": "en"] as [String : Any]
            httpConnect(resource: ContactInfoRootClass.resourceForContactInfo(), paramters: params,authentication: nil, complation:
                { (json, data) in
                    if let contactInfo = json
                    {
                        self.didFinish?(contactInfo as AnyObject?)
                    }
            })
            { (error, msg) in
                self.didFinishWithError?(error, msg)
            }
    }
    
    func sendFeedbackwith(name: String, mobile: String, email: String, message: String) {
        
        
        let params = ["Name": name , "Phone": mobile , "Email" :  email, "Comment" : message , "appLanguage" : "en"] as [String : Any]
        httpConnect(resource: FeedbackRootClass.resourceForFeedback(), paramters: params,authentication: nil, complation:
            { (json, data) in
                if let forgetPassword = json
                {
                    self.didFinish?(forgetPassword as AnyObject?)
                }
        })
        { (error, msg) in
            self.didFinishWithError?(error, msg)
        }
    }
    
    func logout(token:String)
    {
        httpConnect(resource: LogoutRoot.all, paramters: nil, authentication: token, complation:
        { (json, data) in
            if let login = json
            {
                self.didFinish?(login as AnyObject?)
            }
        })
        { (error, msg) in
            self.didFinishWithError?(error, msg)
        }
    }
    
    func getNotifications(pageNumber:Int, pageSize:Int, auth:String)
    {
        httpConnect(resource: NotificationRoot.resourceForNotifications(pageNumber: pageNumber, pageSize: pageSize), paramters: nil, authentication: auth, complation:
        { (json, data) in
            if let notifications = json
            {
                self.didFinish?(notifications)
            }
        })
        { (error, msg) in
            self.didFinishWithError?(error, msg)
        }
    }
}
