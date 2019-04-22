//
//  main.cpp
//  CPPDemo
//
//  Created by hongwuzhao on 1/18/19.
//  Copyright © 2019 tencent. All rights reserved.
//

#include <string>
#include <sstream>
#include <iostream>
#include <vector>

struct ListNode {
         int val;
         ListNode *next;
         ListNode(int x) : val(x), next(NULL) {}
     };
class Node {
public:
    int val;
    Node* prev;
    Node* next;
    Node* child;

    Node() {}

    Node(int _val, Node* _prev, Node* _next, Node* _child) {
        val = _val;
        prev = _prev;
        next = _next;
        child = _child;
    }
};

class Solution {
public:
    ListNode* mergeKLists(std::vector<ListNode*>& lists) {
        ListNode *head = new ListNode(0);
        ListNode * currentNode = head;
        while(!lists.empty()) {
            auto minIt = lists.begin();
            for(auto it = lists.begin(); it != lists.end(); ++it) {
                if ((*it)->val < (*minIt)->val) {
                    minIt = it;
                }
            }
            if (minIt == lists.end()) {
                break;
            }
            currentNode->next = *minIt;
            currentNode = currentNode->next;
            lists.erase(minIt);
            lists.push_back(currentNode->next);
            currentNode->next = NULL;
        }
        return head->next;
    }
};
//class Solution {
//public:
//    Node* flatten(Node* head)
//    {
//        std::vector<Node*> stack;
//        Node *current = head;
//        while(current)
//        {
//            if (current->child)
//            {
//                if (current->next)
//                    stack.push_back(current->next);
//                current->next = current->child;
//            }
//            else if (current->next == NULL && !stack.empty())
//            {
//                Node *tmpNode = stack.back();
//                if (tmpNode) {
//                    stack.pop_back();
//                    current->next = tmpNode;
//                }
//            }
//            current = current->next;
//        }
//        return head;
//    }
//};
int main(int argc, const char * argv[]) {
    // insert code here...
    Node *node1 = new Node();
    node1->child = NULL;
    node1->prev = NULL;
    node1->val = 1;
    Node *node2 = new Node();
    node2->child = NULL;
    node2->next = NULL;
    node2->val = 2;
    node1->next = node2;
    Node *node3 = new Node();
    node3->val = 3;
    node1->child = node3;
    node3->child = NULL;
    node3->next = NULL;
    Solution *sulution = new Solution();
//    Node *head = sulution->flatten(node1);


    std::vector<Node*>list;
//    list.push_back(node1);
    auto it = list.begin();
    if (it == list.end()) {
        std::cout << "null" << std::endl;
    }
//    std::cout << (*it)->val << std::endl;
    return 0;
}
