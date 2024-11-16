import 'package:flutter/material.dart';

class CurrencyKeypad extends StatefulWidget {
  final Function(String) onKeyTap; // Function to handle key taps

  const CurrencyKeypad({Key? key, required this.onKeyTap}) : super(key: key);

  @override
  _CurrencyKeypadState createState() => _CurrencyKeypadState();
}

class _CurrencyKeypadState extends State<CurrencyKeypad> {
  String _input = '';

  void _handleKeyTap(String key) {
    setState(() {
      // Ensure only one decimal point is allowed
      if (key == '.' && _input.contains('.')) {
        return;
      }
      _input += key;
      widget.onKeyTap(_input);
    });
  }

  void _handleDelete() {
    setState(() {
      if (_input.isNotEmpty) {
        _input = _input.substring(0, _input.length - 1);
        widget.onKeyTap(_input);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text(
        //   '$_input',
        //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        // ),
        Container(
          width: 300,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: [
              ...['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0']
                  .map((key) => _buildKey(key)),
              _buildDeleteKey(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKey(String key) {
    return GestureDetector(
      onTap: () => _handleKeyTap(key),
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            key,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteKey() {
    return GestureDetector(
      onTap: _handleDelete,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Center(
          child: Icon(Icons.backspace, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
