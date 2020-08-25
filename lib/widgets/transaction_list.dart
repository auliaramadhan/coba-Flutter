import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.blue,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transaction yet'),
                Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ],
            )
          : ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
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
                        padding: EdgeInsets.all(8),
                        child: FittedBox(child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        color: Theme.of(context).errorColor,
                        onPressed: () => removeTransaction(transactions[index].id)),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Colors.pinkAccent,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           'Rp. ${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Container(
                //             child: Text(
                //               transactions[index].title,
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //           Container(
                //             child: Text(
                //               DateFormat.yMMMd().format(transactions[index].date),
                //               style: TextStyle(color: Colors.grey),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}
