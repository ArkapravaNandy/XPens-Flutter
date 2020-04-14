import 'package:flutter/material.dart';
import 'package:xpens/widgets/chart.dart';
import 'package:xpens/widgets/new_txn.dart';
//import './widgets/user_txn.dart';
import './widgets/TransactionList.dart';
import './models/transaction.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpens',
      theme: ThemeData(
        fontFamily: 'BalooPaaji',
        accentColor: Colors.amber,
        primarySwatch: Colors.purple,
      ),
      home : HomePage() ,
    );    

  }


}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Transaction>get  _RecentTxn{
      return _userTxn.where((tx){
        return tx.txnDate.isAfter(DateTime.now().subtract(Duration(days:7)));
      }).toList();
  }
  
  //Modal Sheet
  void _bringUpNewTxn(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        child: NewTxn(_addNewTxn),
        onTap: (){},
        behavior: HitTestBehavior.opaque,
      ) ;
    });
  }  

  final titleControl=TextEditingController();

  final amtControl=TextEditingController();
  final List<Transaction> _userTxn=[
    //Transaction(id: 't3', title: 'Stationary', amount:1400.00, txnDate: DateTime.now()),
   // Transaction(id: 't4', title: 'House Rent', amount:35000.00, txnDate: DateTime.now()),
  
  ] ;
void _addNewTxn(String title, double amt, DateTime dt){
    final Transaction newtxn=Transaction(
      title: title, amount: amt, txnDate:dt,
      id:DateTime.now().toString());
      setState(() {
        _userTxn.add(newtxn);
      });
  }
  @override
   build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpens'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle),
          onPressed: (){
            _bringUpNewTxn(context);
          },)
        ],
      ),
      body:
      (_userTxn.isEmpty)?
      Container(child: 
      Column(
       
        children: <Widget>[
          Text("No Transactions!" ,
          
          style:TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
          Container(
            height: 300,
            child:
          Image.asset('assets/Images/List.png',
          fit: BoxFit.cover),),
        ],
      )
      ,
      alignment:Alignment(0, 0) ,)
      :
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
              Chart(_RecentTxn)
            ,
             width: double.infinity,
            ),
              elevation: 5,
              ),
              TransactionList(_userTxn, _deleteTransaction),
        
    ],
      
    ),
      
      ),

    
    floatingActionButton: FloatingActionButton(
    onPressed:(){
      _bringUpNewTxn(context);
    } ,
    child: Icon(Icons.add),
    elevation: 5,
    
    ),
    );
  }
  void _deleteTransaction(String id){
    setState(() {
      _userTxn.removeWhere((tx){
          return tx.id==id;
      });
    });
  }
}
