//
//  Problems.swift
//  AlgorithmSwift
//
//  Created by Liangzan Chen on 1/31/18.
//  Copyright © 2018 clz. All rights reserved.
//

import Foundation

/*
 Objective: Given a number N, Write an algorithm to print all possible subsets with Sum equal to N
 
 Example:
 
 N=4
 
 1111
 112
 121
 13
 211
 22
 31
 4
 */


/*
 
 Objective : Given an string and a dictionary of words, find out if the input string can be broken into a space-separated sequence of one or more dictionary words.
 
 Example:
 
 dictionary = ["I" , "have", "Jain", "Sumit", "am", "this", "dog"]
 
 String = "IamSumit"
 
 Output: "I am Sumit"
 
 String ="thisisadog"
 
 Output : String can't be broken
 */


/*
 Objective : A knight’s tour is a sequence of moves of a knight on a chessboard such that the knight visits every square only once. If the knight ends on a square that is one knight’s move from the beginning square (so that it could tour the board again immediately, following the same path), the tour is closed, otherwise it is open. (Source : http://en.wikipedia.org/wiki/Knight%27s_tour)
 
 
 
 */


/*
 Objective : Given a 2D matrix of characters. Check whether the word exist in the matrix or not. If it exists then print its path. All movements are allowed (right, left, up, down and diagonally).
 
 */


/*
 
 Objective : In chess, a queen can move as far as she pleases, horizontally, vertically, or diagonally. A chess board has 8 rows and 8 columns. The standard 8 by 8 Queen’s problem asks how to place 8 queens on an ordinary chess board so that none of them can hit any other in one move.(Source: http://www.math.utah.edu/~alfeld/queens/queens.html)
 
 Here we are solving it for N queens in NxN chess board.
 
 */

/*
 
 Given a maze, NxN matrix. A rat has to find a path from source to destination. maze[0][0] (left top corner)is the source and maze[N-1][N-1](right bottom corner) is destination. There are few cells which are blocked, means rat cannot enter into those cells. Rat can move in any direction ( left, right, up and down).
 
 Input: A 2D-matrix with 0’s and 1’s fill in it. 0 means that cell is blocked and 1 means rat can move to that cell.
 
 */

/*
 
 Objective: A child is climbing up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible ways the child can jump up the stairs.
 
 Example:
 
 Number of stairs : 3
 
 Number of ways = 4 ( {1,1,1}, {1,2}, {2,1}, {3} )
 
 */


/*
 Objective: Given a amount ‘A’ and n coins,   v1<v2<v3<………..<vn . Write a program to find out minimum numbers of coins required to make the change for the amount ‘A’.
 
 Example:
 
 Amount: 5
 
 Coins [] = 1, 2, 3.
 
 No of ways to make the change are : { 1,1,1,1,1} , {1,1,1,2}, {2,2,1},{1,1,3} and {3,2}.
 
 So as we can see minimum number of coins required are 2 ( 3+2=5}.
 */

/*
 
 Objective: Given k sorted array, write an algorithm to merge Them into One sorted array.
 
 Example :
 
 int[][] A = new int[5][];
 
 A[0] = new int[] { 1, 5, 8, 9 };
 A[1] = new int[] { 2, 3, 7, 10 };
 A[2] = new int[] { 4, 6, 11, 15 };
 A[3] = new int[] { 9, 14, 16, 19 };
 A[4] = new int[] { 2, 4, 6, 9 };
 
 Output:
 [1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 8, 9, 9, 9, 10, 11, 14, 15, 16, 19]
 */


/*
 
 Objective: – Given a binary tree, find the diameter of it.
 
 What is Diameter Of a Tree: Diameter of tree is defined as A longest path or route between any two nodes in a tree. The path may or may not for through the root.
 
 */


/*
 Objective: – Find the Height of a tree without Recursion.
 
*/

/*
 
 Objective: Given a set of numbers, print all the posssible subsets of it including empty set.
 
 Power Set: In mathematics, PowerSet of any given set S, PS(S) is set of all subsets of S including empty set.
 Example:
 
 S ={1,2,3}
 
 PS(S): {{ᵩ}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3}}.
 
 */

/*
 
 Objective: Given an array of integers of size N, print all the subsets of size k. (k<=N)
 
 Example:
 
 Generate all subsets of a fixed size k of a given set [1,2,3…n]. e.g, if n=5 and k=3, the output will look like
 
 1 2 3     1 2 4     1 2 5
 1 3 4     1 3 5     1 4 5
 2 3 4     2 3 5     2 4 5
 3 4 5
 
 */


/*
 Objec­tive: – Given “n”, generate all valid parenthesis strings of length “2n”.
 Example:
 
 Given n=2
 
 Output:
 (())
 ()()
 
 */

/*
 Objective: We know that Queue is FIFO (First-in-First-Out) and Stack is LIFO ( Last-in-First-Out).
 
 Here our objective is to implement queue using stacks.
 
 Approach:
 
 Take 2 Stacks, stack1 and stack2.
 stack1 will be used a back of the Queue and stack2 will be used as front of the Queue.
 Push() operation will be done on stack1, and peek() and pop() operations will be done on stack2.
 When peek() and pop() are called, check is stack2 is empty, if yes then move all the elements from stack1 and push them into stack2.
 */

/*
 Objective: Given a Linked List, Sort it using merge sort.
 Example:
 
 ->9->3->4->2->5->1
 
 Sorted List: ->1->2->3->4->5->9
 */


/*
 Objective: – Given a preorder traversal, construct BST from that, without using recursion.
 
 Input: Preorder traversal
 
 Similar Problem : This problem is similar to the Construct Binary Search Tree from a given Preorder Traversal using Recursion.
 
 Approach:
 
 Example: int[] preOrder = { 20, 10, 5, 1, 7, 15, 30, 25, 35, 32, 40 };
 Use Stack.
 First element in the preorder[] will definitely be the root, which is 20 here.
 Create a node with data 20 and push it in Stack.
 Now take the next element (say ‘data’) from the preorder sequence.
 If ‘data’ is greater than the top item in the stack then keep popping out the nodes from the stack, keep storing it in temp node till the top node in stack is less than the ‘data’.
 create a node with ‘data’ and add it to the right of temp node and push the temp node to stack.
 If ‘data’ is less than the top item in the stack then create a node with ‘data’ and add it to the left of top node in stack and push it in the stack.
 Repeat the above two steps till all the elements in preorder[] is over.
 return the root
 Time Complexity: O(n)
 */


/*
 
 Objective: – Given a preorder traversal, construct BST from that.
 
 Input: Preorder traversal
 
 Similar Problem : This problem is similar to the – Construct Binary Search Tree from a given Preorder Traversal Using Stack (Without Recursion)
 
 */

/*
 In an Array, find the Smallest Subarray with Sum Greater than the Given Value
 Objective: Given an array and an integer, find the smallest subarray whose sum is greater than the given integer.
 
 Examples:
 
 arrA[] = { 1, 5, 20, 70, 8}
 Integer = 97
 Output : Min Length = 3 Subarray = [20, 70, 8]
 
 
 arrA[] = { 1, 10, 3, 40, 18}
 Integer = 50
 Output : Min Length = 2 Subarray = [40, 18]
 */
 
 
 
 /*
 Find All Elements in an Array which appears more than N/K times, N is Array Size and k is a Number.
 Objective: Given an array of size of N and number k. Find all elements in an Array which appears more than N/K times.
 
 Input: Array [] and number k.
 
 Example:
 
 int[] arrA = { 2, 2, 4, 4, 3, 5, 3, 4, 4, 6, 4, 3, 3, 8 };
 
 K = 4
 
 N/k = 14/4 = 3
 
 Output will be [3,4] they appear 5, 4 times respectively.
 
 */

/*
 Print All The Nodes Which are X distance from the Given Node
 
 Objective: – Given Binary Tree, Print All The Nodes Which are X distance from the Given Node.
 

 */


/*
 In a Binary Tree, Create Linked Lists of all the nodes at each depth.
 
 Objective: Given a Binary tree create Linked Lists of all the nodes at each depth , say if the tree has height k then create k linked lists.
 
 */

/*
 Level Order Traversal, Print each level in separate line.
 Objective: Given a Binary tree , Print each level of a tree in separate line.
 
 NOTE : This problem is very similar ” Create Linked Lists of all the nodes at each depth “
 
 Input: A binary tree
 
 Output: Each level of binary tree, in one line
 */

/*
 Find the Maximum Depth OR Height of a Binary Tree
 Objective: Given a binary tree, find the height of it
 
 Input: A Binary Tree
 
 Output: Height of a binary tree
 */
 
 
 
 
 
 
 
 
 
