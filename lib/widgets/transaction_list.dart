import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? LayoutBuilder(builder: (ctx,constraints) {
      return Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 20,),
          SizedBox(
              height: constraints.maxHeight * 0.6,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)
          ),
        ],
      );
    }) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SizedBox(
                    height: 20,
                    child: FittedBox(
                        child: Text('\$${transactions[index].amount}', style: const TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            title: Text(
              transactions[index].title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: MediaQuery.of(context).size.width > 460
                  ? TextButton.icon(
                      onPressed: () => deleteTransaction(transactions[index].id),
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).errorColor
                      ),
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')
                  )
                  : IconButton(
                      onPressed: () => deleteTransaction(transactions[index].id),
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
              ),
            ),
          );
        },
        itemCount: transactions.length,
      );
  }
}
