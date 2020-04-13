import 'package:flutter/material.dart';
import './widgets/user_txn.dart';
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
  void bringUpNewTxn(){
    showModalBottomSheet(context: null, builder: null);
  }  
  final titleControl=TextEditingController();
  final amtControl=TextEditingController();

  //String titleInput;
  //String amtInput; 

  @override
   build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpens'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle),
          onPressed: (){},)
        ],
      ),
      body:
      //Wrapping the body data within SingleChildScrollView() enables Scrolling
      SingleChildScrollView( 
        child:
      Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        //here we have used card widget inside the column
        Card(
          
          child: Container(
            
            child:

            Text('CHART!', textAlign: TextAlign.center,
        ),
             width: double.infinity,
            ),
              elevation: 5,
              ),
        UserTxn(),
      ],
      ),

    ),
    floatingActionButton: FloatingActionButton(
    onPressed:(){} ,
    child: Icon(Icons.add),
    elevation: 5,
    
    ),
    );
  }
}
