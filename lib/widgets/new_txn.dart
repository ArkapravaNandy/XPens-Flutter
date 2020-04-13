

import 'package:flutter/material.dart';

//import '../models/transaction.dart';
class NewTxn extends StatelessWidget {
  final titleControl=TextEditingController();
  final amtControl=TextEditingController();
  
  final Function addTxn;
  NewTxn(this.addTxn);

  void submitData(){
    final enteredTitle=titleControl.text;
    final enteredAmt=double.parse(amtControl.text);
    if(enteredTitle.isEmpty || enteredAmt<=0)
      return;
    addTxn(
      enteredTitle,
      enteredAmt);     
  }
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Card(
        
          elevation: 5,
          child: 
          Container(
            padding:EdgeInsets.all(6) ,
            child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
            
              Container(
                padding:EdgeInsets.all(3.5),
                child:

              TextField(
                controller: titleControl,
                onSubmitted: (_)=> submitData(),
                //onChanged:(val){titleControl=val;} ,
                decoration: InputDecoration(labelText: 'Title',
                labelStyle: TextStyle(color:Colors.purple),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color:Colors.purple, width:2.5 ) ,
                
              )
               ),),),
              TextField(
                onSubmitted: (_)=> submitData(),
                controller: amtControl,
                keyboardType: TextInputType.numberWithOptions(),//only numbers available on the amt. keyboard
                //onChanged: (val)=>amtInput=val,
                decoration: InputDecoration(labelText: 'Amount',
                labelStyle: TextStyle(color:Colors.purple),
                focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color:Colors.purple, width:2.5 ) ,
                
                
              )),
                
                ),
                FlatButton(onPressed: (){
                      submitData();
                  }, child: Text('Add Transaction'))
          ],),),
         

        ),
        
    );
  }
}