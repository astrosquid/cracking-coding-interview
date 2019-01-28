#include <stdio.h>

struct ListNode {
  struct ListNode *next;
  int val;
} *head = NULL, *second = NULL, *third = NULL, *next;

int main() {
  struct ListNode head;
  head.val = 1;

  struct ListNode second;
  second.val = 10;
  head.next = &second;

  struct ListNode third;
  third.val = 100;
  second.next = &third;

  struct ListNode *next;
  next = &head;

  while (next != NULL) {
    printf("%d\n", next -> val);
    next = next -> next;
  }

  return 0;
}

