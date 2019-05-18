# Data Structures and Algorithms

## Project 1: Searching Binary Tress

This project's goal is to build a simple binary tree data structure from some arbitrary input. Then create two search algorithm (Breadth first search and Depth first search) to crawl/locate the data inside the binary tree data structure from a given target.

## Project 2: Knight's Travails

The goal of this project is to build a search algorithm which take a chess knight and find the shortest possible route/path from a starting position to an ending position.

This project was quite challenging for me, I didn't know how I should approach it. The first task was to make a chess board which is represented as having 2-dimensional coordinates. My idea was to create a matrices/multi-dimensional array to respresent the board but this wasn't the correct approach. Since the provided example for one of the function which takes an array of x and y coordinates as an input.

```
knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])
```

Since not knowing how I should represent the chess board, I couldn't do anything. Although I had two idea on how I should search for the shortest path. One was to represent each square on the chess board as vertex/node which then could be use to search for different paths then compare the result and select the shortest path. The second appraoch were to create 8 vertices/nodes on the fly after taking in the starting position of the knight.

Then I got some help from John Quarle's [blog post](http://qdevdive.blogspot.com/2015/01/knights-travails-moving-chess-knight.html) and look at a few of the solutions submitted by other students. Although I understand the concept of the graph data structure, after going through this solution I am still not feeling comfortable representing it in program.

Created as part of The Odin Project's [curriculum](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms)