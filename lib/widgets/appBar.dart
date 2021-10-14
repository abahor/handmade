import 'package:flutter/material.dart';

AppBar BuildAppBar (context)=> AppBar(
// title: Text(''),
// backgroundColor: Colors.white,
elevation: 0,
iconTheme: IconThemeData(color: Colors.black),
// leading: IconButton(
//   icon: SvgPicture.asset("assets/icons/back.svg"),
//   onPressed: () {
//
//   },
// ),
actions: <Widget>[

SizedBox(width: 45,),

Container(
alignment: Alignment.center,

// margin: EdgeInsets.all(value),
child: Container(
width: MediaQuery.of(context).size.width * .75,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(25),
// border: Border.all(
// width: 1, color: Colors.blueGrey, style: BorderStyle.solid)
),
child: TextField(
decoration: InputDecoration(
hintText: 'Type someting here',
contentPadding: EdgeInsets.all(15),
border: InputBorder.none
),
onChanged: (value) {},
),
),
),
Container(
// color: Colors.black,
child: IconButton(onPressed: (){

}, icon: Icon(Icons.login),color: Colors.black,)
)



],
);