//
//	Tournament.swift
//
//	Create by Shady Abdou on 3/1/2017
//	Copyright © 2017 LinkDev. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Tournament{

	var competetions : Competetion!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let competetionsData = dictionary["Competetions"] as? NSDictionary{
			competetions = Competetion(fromDictionary: competetionsData)
		}
	}

}