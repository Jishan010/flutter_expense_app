import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context,index){
         return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(DateFormat.yMMMEd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ))
                ],
              )
            ]),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
