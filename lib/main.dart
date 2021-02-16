import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input;
  List<String> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CRUD Operation'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("ADD ToDOS List"),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Add"),
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
        ),
        body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(todos[index]),
                child: Card(
                    child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.blue,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Edit ToDOS List"),
                              content: TextField(
                                onChanged: (String input) {
                                  input = input;
                                },
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Add"),
                                  onPressed: () {
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    },
                  ),
                )),
              );
            }));
  }
}
