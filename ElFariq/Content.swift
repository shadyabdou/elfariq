//
//	Content.swift
//
//	Create by Shady Abdou on 2/1/2017
//	Copyright © 2017 LinkDev. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Content{

	var author : String!
	var category : String!
	var date : String!
	var detailsUrl : String!
	var iD : String!
	var imageUrl : String!
	var subTitle : String!
	var title : String!
	var views : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		author = dictionary["Author"] as? String
		category = dictionary["Category"] as? String
		date = dictionary["Date"] as? String
		detailsUrl = dictionary["DetailsUrl"] as? String
		iD = dictionary["ID"] as? String
		imageUrl = dictionary["ImageUrl"] as? String
		subTitle = dictionary["SubTitle"] as? String
		title = dictionary["Title"] as? String
		views = dictionary["Views"] as? Int
	}

}