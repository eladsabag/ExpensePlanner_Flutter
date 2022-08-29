// @dart=2.9
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'New Hat', amount: 59.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Hamburger', amount: 12.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: _userTransactions.map((transaction) {
      return Card(
        child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 2
                )
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '\$${transaction.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction.title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],)
        ],),
      );
    }).toList(),);
  }
}
