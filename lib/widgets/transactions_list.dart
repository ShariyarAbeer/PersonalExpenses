import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List _userTransactions;
  final Function _deleteTransactions;

  TransactionList(this._userTransactions, this._deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (
                ctx,
                constraints,
              ) {
                return Column(
                  children: <Widget>[
                    Text(
                      "No transactions added yet!!",
                      //style: Theme.of(context).textTheme.title,
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text("${_userTransactions[index].cost}")),
                      ),
                    ),
                    title: Text(
                      _userTransactions[index].item,
                      //style: Theme.of(context).textTheme.title,
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_userTransactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          _deleteTransactions(_userTransactions[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
