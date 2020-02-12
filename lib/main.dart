import 'package:flutter/material.dart';

void main() => runApp(App());

class _AppState extends State<App> {

  List _tasks = [];

  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      home: Scaffold(
        appBar: AppBar(title: Text('ToDo List')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: "enter task name"),
                  controller: _controller,
                  onSubmitted: (String value) {
                    setState(() {
                      _tasks.add(value);
                    });
                    _controller.clear();
                }),
                Flexible(child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.check),
                      title: Text(_tasks[index]),
                      trailing: Text('')
                    );
                  }
                ))
              ]
            )
          )
        )
      );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}





