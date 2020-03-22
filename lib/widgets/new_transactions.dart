import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({Key key}) : super(key: key);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
      ],
    );
  }
}
