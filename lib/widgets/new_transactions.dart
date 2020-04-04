import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransactions;

  NewTransaction(this._addNewTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final costInputController = TextEditingController();

  void submitData() {
    final titleEnter = titleInputController.text;
    final costEnter = double.parse(costInputController.text);
    if (titleEnter.isEmpty || costEnter <= 0) {
      return;
    } else {
      widget._addNewTransactions(
        titleEnter,
        costEnter,
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleInputController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: costInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              //textColor: Colors.blue,
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
