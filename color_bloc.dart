import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent {to_black, to_light_blue_Accent}

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.black;

  @override
  Color get initialState => Colors.black;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {

    _color = (event == ColorEvent.to_black)? Colors.black : Colors.lightBlueAccent;
    yield _color;
  }

}