import 'package:flutter/material.dart';

import '../models/button_model.dart';

class ButtonController {
  final List<ButtonModel> buttons = [
    ButtonModel('Botón A', 0, Colors.red),
    ButtonModel('Botón B', 0, Colors.green),
    ButtonModel('Botón C', 0, Colors.blue),
  ];

  void incrementCounter(ButtonModel button) {
    button.counter++;
  }
}
