import 'package:flutter/material.dart';
import './SumaPage.dart';
import './RestaPage.dart';
import './MultiplicacionPage.dart';
import './DivisionPage.dart';
import './ModuloPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Operaciones Matemáticas'),
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
                const Text(
                  'Seleccione una operación:',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFF1F0E8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildOperationButton(
                      context,
                      'Suma',
                      Icons.add,
                      SumaPage(),
                    ),
                    _buildOperationButton(
                      context,
                      'Resta',
                      Icons.remove,
                      RestaPage(),
                    ),
                    _buildOperationButton(
                      context,
                      'Multiplicación',
                      Icons.close,
                      MultiplicacionPage(),
                    ),
                    _buildOperationButton(
                      context,
                      'División',
                      Icons.horizontal_split,
                      DivisionPage(),
                    ),
                    _buildOperationButton(
                      context,
                      'Módulo',
                      Icons.percent,
                      ModuloPage(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOperationButton(
      BuildContext context, String title, IconData icon, Widget nextPage) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE5E1DA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: const Color(0xFF89A8B2)),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF89A8B2),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
