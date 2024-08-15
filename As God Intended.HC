// HolyC Todo List Application

#define MAX_TODOS 100
#define MAX_TITLE_LENGTH 50
#define MAX_DESCRIPTION_LENGTH 200

class Todo {
  I64 id;
  U8 title[MAX_TITLE_LENGTH];
  U8 description[MAX_DESCRIPTION_LENGTH];
  Bool completed;
  I64 priority;
  I64 due_date; // Unix timestamp
};

Todo todos[MAX_TODOS];
I64 todo_count = 0;

U0 InitializeTodos()
{
  I64 i;
  for (i = 0; i < MAX_TODOS; i++) {
    todos[i].id = i;
    StrCpy(todos[i].title, "");
    StrCpy(todos[i].description, "");
    todos[i].completed = FALSE;
    todos[i].priority = 0;
    todos[i].due_date = 0;
  }
}

U0 AddTodo(U8 *title, U8 *description, I64 priority, I64 due_date)
{
  if (todo_count >= MAX_TODOS) {
    "Error: Todo list is full\n";
    return;
  }

  Todo *new_todo = &todos[todo_count++];
  StrCpy(new_todo->title, title);
  StrCpy(new_todo->description, description);
  new_todo->completed = FALSE;
  new_todo->priority = priority;
  new_todo->due_date = due_date;

  "Todo added successfully\n";
}

U0 DisplayTodo(Todo *todo)
{
  "ID: %d\n", todo->id;
  "Title: %s\n", todo->title;
  "Description: %s\n", todo->description;
  "Completed: %s\n", todo->completed ? "Yes" : "No";
  "Priority: %d\n", todo->priority;
  "Due Date: %d\n", todo->due_date;
  "\n";
}

U0 ListTodos()
{
  I64 i;
  for (i = 0; i < todo_count; i++) {
    DisplayTodo(&todos[i]);
  }
}

U0 CompleteTodo(I64 id)
{
  if (id < 0 || id >= todo_count) {
    "Error: Invalid todo ID\n";
    return;
  }

  todos[id].completed = TRUE;
  "Todo marked as completed\n";
}

U0 DeleteTodo(I64 id)
{
  if (id < 0 || id >= todo_count) {
    "Error: Invalid todo ID\n";
    return;
  }

  I64 i;
  for (i = id; i < todo_count - 1; i++) {
    MemCpy(&todos[i], &todos[i+1], sizeof(Todo));
    todos[i].id = i;
  }

  todo_count--;
  "Todo deleted successfully\n";
}

U0 SortTodosByPriority()
{
  I64 i, j;
  Todo temp;
  
  for (i = 0; i < todo_count - 1; i++) {
    for (j = 0; j < todo_count - i - 1; j++) {
      if (todos[j].priority < todos[j+1].priority) {
        MemCpy(&temp, &todos[j], sizeof(Todo));
        MemCpy(&todos[j], &todos[j+1], sizeof(Todo));
        MemCpy(&todos[j+1], &temp, sizeof(Todo));
      }
    }
  }

  "Todos sorted by priority\n";
}

U0 SearchTodos(U8 *keyword)
{
  I64 i;
  Bool found = FALSE;

  for (i = 0; i < todo_count; i++) {
    if (StrIMatch(todos[i].title, keyword) || StrIMatch(todos[i].description, keyword)) {
      DisplayTodo(&todos[i]);
      found = TRUE;
    }
  }

  if (!found) {
    "No todos found matching the keyword\n";
  }
}

U0 Main()
{
  I64 choice;
  U8 title[MAX_TITLE_LENGTH];
  U8 description[MAX_DESCRIPTION_LENGTH];
  I64 id, priority, due_date;
  U8 keyword[50];

  InitializeTodos();

  while (1) {
    "Todo List Application\n";
    "1. Add Todo\n";
    "2. List Todos\n";
    "3. Complete Todo\n";
    "4. Delete Todo\n";
    "5. Sort Todos by Priority\n";
    "6. Search Todos\n";
    "0. Exit\n";
    "Enter your choice: ";
    
    choice = GetI64;

    switch (choice) {
      case 1:
        "Enter title: ";
        GetS(title, MAX_TITLE_LENGTH);
        "Enter description: ";
        GetS(description, MAX_DESCRIPTION_LENGTH);
        "Enter priority (1-5): ";
        priority = GetI64;
        "Enter due date (Unix timestamp): ";
        due_date = GetI64;
        AddTodo(title, description, priority, due_date);
        break;
      case 2:
        ListTodos();
        break;
      case 3:
        "Enter todo ID to complete: ";
        id = GetI64;
        CompleteTodo(id);
        break;
      case 4:
        "Enter todo ID to delete: ";
        id = GetI64;
        DeleteTodo(id);
        break;
      case 5:
        SortTodosByPriority();
        break;
      case 6:
        "Enter keyword to search: ";
        GetS(keyword, 50);
        SearchTodos(keyword);
        break;
      case 0:
        "Exiting...\n";
        return;
      default:
        "Invalid choice. Please try again.\n";
    }

    "\nPress any key to continue...";
    GetChar;
    Cls;
  }
}

Main;
