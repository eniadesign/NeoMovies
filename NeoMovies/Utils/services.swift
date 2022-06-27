//
//  services.swift
//  NeoMovies
//
//  Created by ALFONSO on 23/06/22.
//

import Foundation

enum Environment {
    
    case development
    case staging
    case production
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(subdomain()).\(domain())\(route())"
    }
    
    func baseURLLogin() -> String {
        return "\(urlProtocol())://eniadesign.com.mx"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        default:
            return "https"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "org"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development:
            return "api.themoviedb"
        case .staging:
            return "api.themoviedb"
        case .production:
            return "api.themoviedb"
        }
    }
    
    func route() -> String {
        return "/3"
    }
    
}

extension Environment {
    func host() -> String {
        return "\(self.subdomain()).\(self.domain())"
    }
}


// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()
let baseUrllogin = environment.baseURLLogin()
var apkey: String { return "?api_key=32bbaec60f9bd41c0e6209870feab6a7&language=en-US&page=1"}

struct Path {
   
    var registration: String { return "\(baseUrl)/registration" }
    
    var login: String { return "\(baseUrllogin)/log.php" }
    
    var forgotPassword: String { return "\(baseUrl)/forgotPassword" }
    
    var logout: String { return "\(baseUrl)/logout" }
    
    var movie: String { return "\(baseUrl)/movie/popular\(apkey)" }
    
    var tv: String { return "\(baseUrl)/tv/popular\(apkey)" }
    
    var movieTopRated: String { return "\(baseUrl)/movie/top_rated\(apkey)" }
    
    var movieTrending: String { return "\(baseUrl)/trending/all/day\(apkey)" }
    
    
    
    struct User {
        
        var getProfile: String { return "\(baseUrl)/profile" }
        
        var deleteUser: (Int) -> String = { userID in
            return "\(baseUrl)/profile/\(String(userID))"
        }
        
        struct Task {
            
            var getTasks: String { return "\(baseUrl)/tasks" }
            
            var getTaskDetail: (Int, Int) -> String = { userID, taskID in
                return "\(baseUrl)/profile/\(String(userID))/task/\(String(taskID))"
            }
            
        }
    }
}


