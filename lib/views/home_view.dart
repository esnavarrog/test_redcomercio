import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controllers/button_controller.dart';
import '../models/button_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ButtonController _controller = ButtonController();
  final List<Map<String, dynamic>> _history = [];

  void _onButtonPressed(ButtonModel button) {
    setState(() {
      _controller.incrementCounter(button);
      String timestamp = DateFormat(
        'kk:mm:ss - dd-MM-yyyy',
      ).format(DateTime.now());
      _history.add({
        'text':
            '${button.name} presionado, conteo: ${button.counter}, a las: $timestamp',
        'color': button.color,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text(
          'App Botones Contadores',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 2,
            children:
                _controller.buttons.map((button) {
                  return ElevatedButton(
                    onPressed: () => _onButtonPressed(button),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: button.color,
                    ),
                    child: Text(
                      '${button.name} (${button.counter})',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const Text(
            'Historia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                int reverseIndex = _history.length - 1 - index;
                return ListTile(
                  title: Text(
                    _history[reverseIndex]['text'],
                    style: TextStyle(color: _history[reverseIndex]['color']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
