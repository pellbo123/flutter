import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final List<String> todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      todos.add(text.trim());
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo 앱"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "할일을 입력하세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    filled: true,
                    fillColor: Colors.grey[100]
                  ),
                )
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: ()=> _addTodo(_controller.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white
                  ),
                  child: const Text("추가"),
                ),
              ],
            ),
          ),
          Expanded(
              child: todos.isEmpty
                  ? const Center(child: Text("할 일이 없습니다"))
                  : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context,index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4
                      ),
                      child: ListTile(
                        title: Text(todos[index]),
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}
