import 'package:flutter/material.dart';
import 'package:xpens/widgets/TransactionList.dart';
import 'package:xpens/widgets/new_txn.dart';
import '../models/transaction.dart';
class UserTxn extends StatefulWidget {
  @override
  _UserTxnState createState() => _UserTxnState();
}

class _UserTxnState extends State<UserTxn> {
  final List<Transaction> _userTxn=[
    //Transaction(id: 't3', title: 'Stationary', amount:1400.00, txnDate: DateTime.now()),
    //Transaction(id: 't4', title: 'House Rent', amount:35000.00, txnDate: DateTime.now()),
  
  ] ;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTxn(_addNewTxn),
      TransactionList(_userTxn),
    ],
      
    );
  }
  
  void _addNewTxn(String title, double amt){
    final Transaction newtxn=Transaction(
      title: title, amount: amt, txnDate: DateTime.now(),
      id:DateTime.now().toString());
      setState(() {
        _userTxn.add(newtxn);
      });
  }
}