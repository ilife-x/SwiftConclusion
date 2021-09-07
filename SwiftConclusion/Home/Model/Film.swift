//
//  Film.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/9/7.
//

import UIKit

struct  Film : Decodable  {
    let id: Int
    let title: String
    let director: String
    let openingCrawl: String
    let producer: String
    let releaseData: String
    let starships : [ String ]

    enum  CodingKeys : String , CodingKey  {
         case id = "episode_id"
         case title
         case openingCrawl = "opening_crawl"
         case director
         case producer
         case releaseData = "release_date"
         case starships
    }  


}






struct Films: Decodable {
    let count:Int
    let all:[Film]
    
    enum CodingKeys:String,CodingKey {
        case count
        case all = "results"
    }
    
}

//extension Film:Displayable{
//    var subTitleLabelText:String{
//        "Episode \(String(id))"
//    }
//
//}
