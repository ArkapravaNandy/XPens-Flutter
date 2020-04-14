import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> userTxn;
  final Function _delTxn; 
  TransactionList(this.userTxn, this._delTxn);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Column(children: userTxn.map((tx){
            return Card(
              elevation: 5,
              child: 
            Container(child:Row(
                                  
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.all(5),
                     child: Text('Rs '+tx.amount.toStringAsFixed(2), 
                     
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:Colors.white, ),),
                     decoration: BoxDecoration(
                       color:Colors.purple,
                      border: Border.all(
                        color: Colors.purple,
                        width: 2.5,
                          
                      ),
                      borderRadius: BorderRadius.circular(5),
                      
                     ),
                   ),
                
                   
                Expanded(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        Container(
                          
                          margin:EdgeInsets.fromLTRB(15,0,0,0),
                          child:
                        Text(tx.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
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
                  ),
                ),
                FloatingActionButton(
                  onPressed:()=>_delTxn(tx.id),
                   
                  child:Icon(Icons.delete),
                  elevation: 0,
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