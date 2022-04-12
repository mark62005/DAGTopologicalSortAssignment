//
//  CourseSchedule207.swift
//  DAGTopologicalSortAssignment
//
//  Created by Mark Wong on 2022-04-09.
//

import Foundation

func courseSchedule(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  var adj = [[Int]](repeating: [], count: numCourses)
  for edge in prerequisites {
    let v = edge[0]
    let u = edge[1]
    adj[u].append(v)
  }
  
  var visited = [Bool](repeating: false, count: numCourses)
  
  func dfs(start: Int, adj: inout [[Int]], visited: inout [Bool]) -> Bool {
    visited[start] = true
    
    for v in adj[start] {
      if !visited[v] {
        return dfs(start: v, adj: &adj, visited: &visited)
      } else {
        return false
      }
    }
    return true
  }
  
  return dfs(start: 0, adj: &adj, visited: &visited)
}
