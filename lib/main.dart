import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpens',
      home : HomePage() ,
    );    

  }


}

class HomePage extends StatelessWidget{
  final List<Transaction> txn=[
    Transaction(id: 'i1', title: 'Salary', amount: 90000.00, txnDate: DateTime.now()),
    Transaction(id: 't2', title: 'Groceries', amount:1400.00, txnDate: DateTime.now()),
    Transaction(id: 't3', title: 'Stationary', amount:1400.00, txnDate: DateTime.now()),
    Transaction(id: 't4', title: 'House Rent', amount:35000.00, txnDate: DateTime.now()),
  ];

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpens'),

      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        //here we have used card widget inside the column
        Card(
          
          child: Container(
            
            child:

            Text('CHART!', textAlign: TextAlign.center,
        ),
            height: 50, width: double.infinity,
            ),
              elevation: 5,
              ),
        Card(
          elevation: 5,
          child: 
          Column(children: <Widget>[
              
              TextField(decoration: InputDecoration(labelText: 'Title',)),
              TextField(decoration: InputDecoration(labelText: 'Amount'),),
          ],)
         

        ),
        Column(children: txn.map((tx){
            return Card(
              
              child: 
            Container(child:Row(
                
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.all(5),
                     child: Text('Rs '+tx.amount.toString(), 
                     
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
          ),
        
      ],
      ),

    );
  }
}
