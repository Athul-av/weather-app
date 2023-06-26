
import 'package:flutter/material.dart';

Text boldtext(String data,double size,FontWeight weight){
return Text(data,style: TextStyle(color: Colors.white,fontSize: size,fontWeight:weight ),);
}
Text boldtext2(String data,double size,FontWeight weight,Color color){
return Text(data,style: TextStyle(color:color,fontSize: size,fontWeight:weight ),);
}