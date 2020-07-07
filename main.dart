import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas12blocpackage/color_bloc.dart';
import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
          builder: (context) => ColorBloc(),
          child:MainPage()
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: (){
              bloc.dispatch(ColorEvent.to_black);
            },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: (){
              bloc.dispatch(ColorEvent.to_light_blue_Accent);
            },
          )
        ],
      ),

      appBar: AppBar(
        title: Text("Filius - bloc page"),
        backgroundColor: Colors.greenAccent,
      ),

      body: Center(
        child: BlocBuilder<ColorBloc,Color>(
          builder: (context,currentColor)=> AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),

        ),
      ),
    );
  }
}