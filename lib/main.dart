import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoApplication(),
    );
  }
}

class TodoApplication extends StatefulWidget {
  const TodoApplication({Key? key}) : super(key: key);

  @override
  _TodoApplicationState createState() => _TodoApplicationState();
}

class _TodoApplicationState extends State<TodoApplication> {
  List<dynamic> tasks = [];
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "TODO Application",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                "No Tasks Added",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.orangeAccent),
                      child: ListTile(
                        leading: Text("${tasks.indexOf(tasks[index]) + 1}"),
                        title: Text(
                          "${tasks[index]}",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Add New Task",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tasks.add(output);
                          });
                          Navigator.pop(context);
                        },
                        child: Text("ADD"))
                  ],
                );
              });
        },
        child: Text(
          "+",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
