import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  InfoCard({ super.key , required this.label,required this.value});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
        trailing: Text(label,style: TextStyle(fontSize: 16),),
      ),
    );
  }}