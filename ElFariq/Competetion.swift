//
//	Competetion.swift
//
//	Create by Shady Abdou on 3/1/2017
//	Copyright © 2017 LinkDev. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Competetion{

	var championship : String!
	var iD : String!
	var logo : String!
	var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		championship = dictionary["Championship"] as? String
		iD = dictionary["ID"] as? String
		logo = dictionary["Logo"] as? String
		name = dictionary["Name"] as? String
	}

}