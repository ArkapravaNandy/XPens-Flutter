

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import '../models/transaction.dart';
class NewTxn extends StatefulWidget {
  final Function addTxn;
  NewTxn(this.addTxn);

  @override
  _NewTxnState createState() => _NewTxnState();
}

class _NewTxnState extends State<NewTxn> {
  final titleControl=TextEditingController();

  final amtControl=TextEditingController();
  DateTime _selectedDate;
  void submitData(){
    final enteredTitle=titleControl.text;
    final enteredAmt=double.parse(amtControl.text);
    if(enteredTitle.isEmpty || enteredAmt<=0 || _selectedDate == null)
      return;
    widget.addTxn(
      enteredTitle,
      enteredAmt,
      _selectedDate);
      Navigator.of(context).pop();     
  }
  
  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2099),
      ).then((DateTime pickedDate) {
        if(pickedDate == null){
          return;}
          setState(() {
            _selectedDate=pickedDate;    
          });
          
      }
      
      );
      print('...');
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
                Row(
                  
                  children: <Widget>[
                  
                  Expanded(child: Text((_selectedDate == null)?'No Date Chosen !': DateFormat.yMMMMd().format(_selectedDate))),

                  Container(
                    
                    margin: EdgeInsets.all(5),
                    //padding:EdgeInsets.all(10) ,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.amber) ,
                    child: FlatButton(onPressed: (){
                      _presentDatePicker();
                    }, child: Text(
                      'Choose Date',
                      style: TextStyle(fontSize: 15.5),
                      ),
                      ),
                  )
                ],),
                    Container(
                      alignment: Alignment(0, 0),
                      padding: EdgeInsets.all(5),
                      child:
                    FloatingActionButton(onPressed: ()=>submitData(),
                     child: Icon(Icons.add_comment),)
                  ),
                     
          
          ],),
          ),
         
        ),
        
    );
    
  }
}