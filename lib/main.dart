import 'package:flutter/material.dart';
import 'package:personalexpenses/transaction.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      item: "New Shrt",
      cost: 1150.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      item: "New Pnt",
      cost: 850.5,
      date: DateTime.now(),
    ),
  ];

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
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.cost.toString() + " Tk",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.item,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
