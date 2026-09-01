import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mi primera app"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                "Formulario",
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(fontSize: 16),
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.green),
                    focusColor: Colors.green,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(fontSize: 16),
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Apellido',
                    labelStyle: TextStyle(color: Colors.green),
                    focusColor: Colors.green,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: TextButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar'),
                  style: TextButton.styleFrom(
                    iconColor: Colors.green,
                    foregroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.green, size: 40),
                    SizedBox(width: 16),
                    Icon(Icons.favorite, color: Colors.green, size: 40),
                    SizedBox(width: 16),
                    Icon(Icons.thumb_up, color: Colors.green, size: 40),
                  ],
                ),
              ),
              Image.network(
                width: 200,
                height: 200,
                "https://images.unsplash.com/photo-1576806021995-9f68eb39f10b?q=80&w=2344&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
