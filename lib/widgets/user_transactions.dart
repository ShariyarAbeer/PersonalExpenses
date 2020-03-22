import 'package:flutter/material.dart';
import '../widgets/transactions_list.dart';
import '../widgets/new_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransactions(String txItem, double txCost) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      item: txItem,
      cost: txCost,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransactions),
        TransactionList(_userTransactions),
      ],
    );
  }
}
