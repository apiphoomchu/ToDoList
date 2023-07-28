//
//  ContentView.swift
//  ToDoList
//
//  Created by Apiphoom Chuenchompoo on 28/7/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("todos") var todosData: Data = Data()
    @State private var todos: [Todo] = []
    @State private var newTodoTitle = ""
    
    var body: some View {
        VStack(spacing: 4) {
            HStack() {
                Text("Todo List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .leading],25)
                Spacer()
            }
            
            List {
                ForEach(todos.indices, id: \.self) { index in
                    HStack {
                        Text(todos[index].title)
                            .strikethrough(todos[index].isCompleted, color: .white)
                            .opacity(todos[index].isCompleted ? 0.5 : 1.0)
                        Spacer()
                        Button(action: {
                            todos[index].isCompleted.toggle()
                            saveTodos()
                        }) {
                            Image(systemName: todos[index].isCompleted ? "checkmark.square" : "square")
                        }
                    }
                }
                .onDelete(perform: deleteTodo)
                
                HStack {
                    TextField("New task", text: $newTodoTitle, onCommit: addTodo)
                    Button(action: addTodo) {
                        Image(systemName: "plus")
                    }
                }
            }
            .toolbar {
                EditButton()
            }
            .onAppear(perform: loadTodos)
        }
    }
    
    private func addTodo() {
        let trimmed = newTodoTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let todo = Todo(title: trimmed)
        todos.append(todo)
        newTodoTitle = ""
        saveTodos()
    }
    
    private func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        saveTodos()
    }
    
    private func saveTodos() {
        if let encoded = try? JSONEncoder().encode(todos) {
            todosData = encoded
        }
    }
    
    private func loadTodos() {
        if let decoded = try? JSONDecoder().decode([Todo].self, from: todosData) {
            todos = decoded
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
