import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addNewTransactions;
  final titleInputController = TextEditingController();
  final costInputController = TextEditingController();

  NewTransaction(this._addNewTransactions);

  void submitData() {
    final titleEnter = titleInputController.text;
    final costEnter = double.parse(costInputController.text);
    if (titleEnter.isEmpty || costEnter <= 0) {
      return;
    } else {
      _addNewTransactions(
        titleEnter,
        costEnter,
      );
    }
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
              textColor: Colors.blue,
              onPressed: submitData,
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
