import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          Text(
              'No transactions added yet!',
              style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 20,),
          Container(height: 200,child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
        ],
      ) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Container(
                    height: 20,
                    child: FittedBox(
                        child: Text('\$${transactions[index].amount}', style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            title: Text(
              transactions[index].title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(
                onPressed: () => deleteTransaction(transactions[index].id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
