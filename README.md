Todo List App using SwiftUI
===========================

This repository contains a simple Todo List app implemented using SwiftUI. The app allows users to add, mark as completed, and delete tasks from their todo list.

Requirements
------------

-   iOS 14.0+
-   Xcode 12.0+
-   Swift 5.3+

Getting Started
---------------

To use the Todo List app, follow the steps below:

1.  Clone the repository to your local machine using the following command:

bashCopy code

`git clone https://github.com/apiphoomchu/ToDoList`

1.  Open the Xcode project (`.xcodeproj`) in Xcode.

2.  Build and run the app on a simulator or a connected device.

Features
--------

### Todo List View

The main view of the app displays the user's list of tasks in a scrollable list. Each task is shown with its title, and completed tasks are strikethrough with reduced opacity.

### Adding a New Task

Users can add a new task by typing the task title in the provided text field and pressing the "+" button. The new task will be added to the list.

### Marking a Task as Completed

To mark a task as completed, tap the square icon next to the task title. This will toggle the completion status of the task. Completed tasks will have a checkmark inside the square icon.

### Deleting a Task

To delete a task, swipe left on the task in the list and tap the "Delete" button.

Code Explanation
----------------

The app is structured around the SwiftUI framework and consists of two main components: the `ContentView` view and the `Todo` model.

### `ContentView` (View)

The `ContentView` struct is the main view of the app and manages the todo list UI. It includes the following key components:

1.  `@AppStorage("todos") var todosData: Data`: An `@AppStorage` property wrapper that allows the app to store the todos in the app's `UserDefaults`. This property is used to persist the todos even after the app is closed.

2.  `@State private var todos: [Todo] = []`: A state property that holds the array of `Todo` objects representing the list of tasks. When this property changes, SwiftUI automatically updates the UI accordingly.

3.  `@State private var newTodoTitle = ""`: A state property that stores the text input for adding a new task.

4.  `var body: some View`: The body of the `ContentView`, defining the UI elements and their layout. The view consists of a VStack containing a title, a list of todos, and an input field with a "+" button to add new tasks.

5.  `ForEach(todos.indices, id: \.self)`: A loop that iterates through the `todos` array and displays each task in the list. Each task is represented by an HStack containing the task title, a completion toggle button, and the task deletion functionality.

6.  `private func addTodo()`: A private method to add a new task to the `todos` array. It trims the input text, creates a new `Todo` object, and appends it to the array.

7.  `private func deleteTodo(at offsets: IndexSet)`: A private method to delete a task from the `todos` array using the indices provided by `IndexSet`.

8.  `private func saveTodos()`: A private method to encode the `todos` array into JSON data and save it using `UserDefaults`.

9.  `private func loadTodos()`: A private method to decode the JSON data stored in `UserDefaults` and populate the `todos` array.

### `Todo` (Model)

The `Todo` struct represents a single task in the todo list. It conforms to the `Identifiable` and `Codable` protocols for unique identification and encoding/decoding from JSON.

The `Todo` struct includes the following properties:

-   `let id: UUID`: A universally unique identifier for the task.
-   `var title: String`: The title of the task.
-   `var isCompleted: Bool`: A boolean flag indicating whether the task is completed or not.

The `Todo` struct also provides an initializer to create a new task with the given properties.

Preview
-------

The `ContentView_Previews` struct provides a preview of the `ContentView` view for Xcode's SwiftUI preview canvas.

Feel free to explore the code, run the app, and use it to manage your todo list effectively!

License
-------

This project is licensed under the MIT License - see the [LICENSE](https://github.com/apiphoomchu/ToDoList/blob/main/LICENSE) file for details.

Acknowledgments
---------------

Special thanks to SwiftUI and Apple for providing the framework and tools to build this Todo List app.
