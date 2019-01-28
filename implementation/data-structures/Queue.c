#include <stdio.h>

int MAX_SIZE = 8;
int back = -1;
int queue[8];

int isEmpty()
{
  if (back == -1) {
    return 1;
  }
  return 0;
}

int isFull()
{
  if (back == MAX_SIZE) {
    return 1;
  }
  return 0;
}

void push(int data)
{
  if (!isFull()) {
    back = back + 1;
    queue[back] = data;
  } 
  else {
    printf("ERROR: push onto filled queue\n");
  }
}

void shuffle() 
{
  if (!isEmpty()) {
    int i;
    for (i = 0; i < back; i++) {
      queue[i] = queue[i + 1];
    }
  } 
}

int pop() 
{
  int data;
  if (!isEmpty()) {
    data = queue[0];
    shuffle();
    back = back - 1;
    return data;
  } else {
    printf("ERROR: pop from empty queue\n");
  }
}

int main(void) 
{
  printf("Pushing...\n");
  push(1);
  push(2);
  push(3);
  push(4);
  push(77);
  push(9000);

  printf("");

  printf("Popping 2: \n");
  printf(" popped: %d\n", pop());
  printf(" popped: %d\n", pop());

  printf("");

  printf("Printing the rest of the list...\n");
  while (!isEmpty()) {
    printf(" popped: %d\n", pop());
  }
}
