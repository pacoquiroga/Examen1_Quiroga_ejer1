import 'package:flutter/material.dart';

class DivisionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DivisionPageState();
}

class DivisionPageState extends State<DivisionPage> {
  final TextEditingController _controllerNum1 = TextEditingController();
  final TextEditingController _controllerNum2 = TextEditingController();
  String _resultado = "";

  void _calcularDivision() {
    if (_controllerNum1.text.isNotEmpty && _controllerNum2.text.isNotEmpty) {
      try {
        final num1 = double.parse(_controllerNum1.text);
        final num2 = double.parse(_controllerNum2.text);

        if (num2 != 0) {
          final division = num1 / num2;
          setState(() {
            _resultado = "Resultado: ${division.toStringAsFixed(4)}";
          });
        } else {
          setState(() {
            _resultado = "Error: No se puede dividir entre cero.";
          });
        }
      } catch (e) {
        setState(() {
          _resultado = "Por favor ingrese números válidos.";
        });
      }
    } else {
      setState(() {
        _resultado = "Por favor complete ambos campos.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('División'),
        backgroundColor: const Color.fromARGB(255, 95, 105, 109),
        titleTextStyle: const TextStyle(
          color: Color(0xFFF1F0E8),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF89A8B2),
              Color(0xFFB3C8CF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controllerNum1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Número 1",
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controllerNum2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Número 2",
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calcularDivision,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 58, 77, 92)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Dividir",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _resultado,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
