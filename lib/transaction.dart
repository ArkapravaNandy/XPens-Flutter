import 'package:flutter/material.dart';

class Transaction{
  @required final String id; //Unique ID for each transacrion
  @required final String title; //How we spent 
  @required final double amount; //amt. of trnsaction
  @required final DateTime txnDate; //date of transaction

  Transaction({this.id, this.amount, this.title, this.txnDate});

}