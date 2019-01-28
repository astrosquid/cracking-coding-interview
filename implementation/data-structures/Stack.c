#include <stdio.h>

int MAX_SIZE = 4;
int stack[4];
int top = -1;

int isEmpty() 
{
  if (top == -1) {
    return 1;
  }
  return 0;
}

int isFull() 
{
  if (top == MAX_SIZE) {
    return 1;
  }
  return 0;
}

int peek() {
  return stack[top];
}

void push(int data) {
  if (!isFull()) {
    top = top + 1;
    stack[top] = data;
  } else {
    printf("ERROR: attempt to push to filled stack\n");
  }
}

int pop() {
  int data;
  if (!isEmpty()) {
    data = stack[top];
    top = top - 1;
    return data;
  } else {
    printf("ERROR: attempt to pop from empty stack\n");
  }
}

int main(void) 
{
  printf("Pushing (last one will error)...\n");
  push(1);
  push(10);
  push(100);
  push(1000);
  push(10000);
  push(100000);

  printf("Peeking... %d\n", peek());

  while (!isEmpty()) {
    printf("Popping: %d\n", pop());
  }

  return 0;
}
