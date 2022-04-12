//
//  CourseScheduleII210.swift
//  DAGTopologicalSortAssignment
//
//  Created by Mark Wong on 2022-04-10.
//

import Foundation

func courseScheduleII(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  var adj = [[Int]](repeating: [Int](), count: numCourses)
  var inDegrees = [Int](repeating: 0, count: numCourses)
  var answer = [Int]()
  
  for edge in prerequisites {
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    inDegrees[v] += 1
  }
  
  let q = Queue<Int>()
  for v in 0..<numCourses {
    if inDegrees[v] == 0 {
      q.enqueue(item: v)
    }
  }
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    answer.insert(u, at: 0)
    
    for v in adj[u] {
      inDegrees[v] -= 1
      
      if inDegrees[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
  
  return answer
}
