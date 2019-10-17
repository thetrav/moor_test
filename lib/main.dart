import 'package:flutter/material.dart';

import 'package:moor_test/database.dart';

void main() => runApp(MyApp());

final db = MyDatabase();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _upsert() {
    db.upsert(
      "CA4C57A1-73CC-4709-AD54-DBBFD151CF0C",
      DateTime.now().toIso8601String()
    );
  }

  void _clear() {
    db.clear();
  }

  @override
  Widget build(BuildContext _) => Scaffold(
    appBar: AppBar(title: Text("Test Moor")),
    drawer: Drawer(
      child: ListView(
        children: [
          ListTile(title: Text("Clear"), onTap: _clear)
        ]
      )
    ),
    body: StreamBuilder(
      stream: db.watchSocks(),
      builder: (context, data) {
        if(data.hasError) {
          return Center(child:Text("Error! ${data.error}"));
        }
        if(data.hasData) {
          return ListView (
            children: data.data.map<Widget>((row) => ListTile(
              title: Text(row.id),
              subtitle: Text(row.label)
            )).toList()
          );
        }
        return Center(child: CircularProgressIndicator());
      }
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _upsert,
      tooltip: 'Upsert',
      child: Icon(Icons.refresh),
    )
  );
}
