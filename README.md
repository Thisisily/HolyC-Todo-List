# HolyC Todo List Application

This is a feature-rich todo list application written in HolyC, designed to run on TempleOS or compatible systems.

## Features

1. Add new todos with titles, descriptions, priorities, and due dates
2. List all todos
3. Mark todos as completed
4. Delete todos
5. Sort todos by priority
6. Search todos by keyword

## How to Run

1. Ensure you have TempleOS or a compatible system installed.
2. Copy the entire code into a new file with a `.HC` extension (e.g., `todo_list.HC`).
3. In TempleOS, navigate to the directory containing your file.
4. Run the application by typing the filename without the extension:

   ```
   todo_list
   ```

## Usage

Upon running the application, you'll be presented with a menu:

```
Todo List Application
1. Add Todo
2. List Todos
3. Complete Todo
4. Delete Todo
5. Sort Todos by Priority
6. Search Todos
0. Exit
```

Choose an option by entering the corresponding number.

### Adding a Todo

- Enter the title (max 50 characters)
- Enter the description (max 200 characters)
- Enter the priority (1-5, with 5 being the highest)
- Enter the due date as a Unix timestamp

### Listing Todos

This will display all todos with their details.

### Completing a Todo

Enter the ID of the todo you want to mark as completed.

### Deleting a Todo

Enter the ID of the todo you want to delete.

### Sorting Todos

This will sort all todos by priority (highest to lowest).

### Searching Todos

Enter a keyword, and the application will display all todos with matching titles or descriptions.

## Limitations

- The application can store a maximum of 100 todos.
- Title length is limited to 50 characters.
- Description length is limited to 200 characters.

## Technical Details

- The application uses a `Todo` class to represent each todo item.
- Todos are stored in a static array.
- The code demonstrates usage of HolyC-specific syntax and functions.

## Contributing

Feel free to fork this project and submit pull requests with improvements or additional features.

## License

This project is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
