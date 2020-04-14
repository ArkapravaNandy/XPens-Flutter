import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpens/widgets/chart_bars.dart';
import '../models/transaction.dart';
class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues{
      return List.generate(7, (index){
        final weekDay=DateTime.now().subtract(Duration(days: index),);
        var totalSum=0.0;
        for(int i=0; i<recentTransactions.length;i++){
          if(recentTransactions[i].txnDate.day == weekDay.day && 
          recentTransactions[i].txnDate.month==weekDay.month 
          && recentTransactions[i].txnDate.year ==weekDay.year){
          totalSum+=recentTransactions[i].amount;}
          }

        return{   
                  'day': DateFormat.E().format(weekDay), 
                  'amount': totalSum,
        };
      });
  }

  double get maxSpending{
    return groupedTransactionValues.fold(0.0,(sum, item){
        return sum+item['amount'];
    }
    );
    }
  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      
      Column(children: <Widget>[
        Text('Expenditure last week', style:TextStyle(
          fontSize:15.5,
          fontWeight: FontWeight.w500,

        ),),
        Container(
        padding:EdgeInsets.all(5) ,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data){
              return /*Text('${data['day']} : ${data['amount']}');
            }).toList()*/ 
            Flexible(
              flex: 1,
              fit: FlexFit.tight ,
              child:           
              ChartBar(data['day'], data['amount'], ((data['amount']) as double)/maxSpending)
            );
            
            }).toList()
        ),
      ),
 
      ],),     
      margin: EdgeInsets.all(5),
      elevation: 5,
    
      );
      

    
  }
}