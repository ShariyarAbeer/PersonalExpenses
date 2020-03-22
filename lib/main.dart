import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Cart"),
              color: Colors.blueAccent,
              elevation: 5,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleInputController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountInputController,
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    onPressed: () => {
                      print(titleInputController.text),
                      print(amountInputController.text),
                    },
                    child: Text("Add Transaction"),
                  )
                ],
              ),
            ),
          ),
          TransactionList(),
        ],
      ),
    );
  }
}
