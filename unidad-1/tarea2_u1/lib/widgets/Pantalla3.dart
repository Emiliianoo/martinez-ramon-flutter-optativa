import 'package:flutter/material.dart';
import 'package:tarea2_u1/widgets/Pantalla2/CustomButton.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key});

  @override
  State<Pantalla3> createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  int cantidad = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 3")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Nombre del producto",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.image_outlined,
                  size: 72.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Precio \$1000",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Descripción",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1996.",
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(texto: cantidad.toString(), readOnly: true),
                  CustomButton(
                    texto: "+",
                    readOnly: false,
                    onPressed: () {
                      setState(() => cantidad++);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
