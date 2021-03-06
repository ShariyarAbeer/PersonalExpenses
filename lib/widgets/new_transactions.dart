import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransactions;

  NewTransaction(this._addNewTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final costInputController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (costInputController.text.isEmpty) {
      return;
    }
    final titleEnter = titleInputController.text;
    final costEnter = double.parse(costInputController.text);
    if (titleEnter.isEmpty || costEnter <= 0 || _selectedDate == null) {
      return;
    } else {
      widget._addNewTransactions(
        titleEnter,
        costEnter,
        _selectedDate,
      );
    }
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleInputController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: costInputController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No date Chosen"
                            : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}",
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: _presentDatePicker,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: _presentDatePicker,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: _submitData,
                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
