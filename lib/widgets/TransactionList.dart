import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> userTxn;

  TransactionList(this.userTxn);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(children: userTxn.map((tx){
            return Card(
              
              child: 
            Container(child:Row(
                                  
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.all(5),
                     child: Text('Rs '+tx.amount.toStringAsFixed(2), 
                     
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: (tx.id.startsWith('i'))?Colors.green:Colors.red ), ),
                     decoration: BoxDecoration(

                      border: Border.all(
                        color: (tx.id.startsWith('i'))?Colors.green:Colors.red,
                        width: 2.5,
                          
                      ),
                      borderRadius: BorderRadius.circular(10),
                      
                     ),
                   ),
                
                   
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      
                      Container(
                        
                        margin:EdgeInsets.fromLTRB(15,0,0,0),
                        child:
                      Text(tx.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      

                      ),
                      )

                      ), 
                      Container(
                        
                        margin:EdgeInsets.fromLTRB(15,0,0,0) ,
                        child:

                        Text(DateFormat.yMMMMd().format(tx.txnDate),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color:  Colors.grey ,
                        ),
                        ),
                        ),

                      ],
                )
                 ],         
            ) ,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(5),
            ),
            );
        }).toList(),
          )
    );
  }
}