//
//	RootClass.swift
//
//	Create by Shady Abdou on 2/1/2017
//	Copyright © 2017 LinkDev. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Category{

	var iD : String!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		iD = dictionary["ID"] as? String
		name = dictionary["Name"] as? String
	}

}
