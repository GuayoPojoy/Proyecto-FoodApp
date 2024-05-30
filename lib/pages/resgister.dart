import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_button.dart'; // Importa el widget CustomButton si aún no está importado.

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCFC),
      appBar: AppBar(
        title: Text('Crear cuenta'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre de usuario',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0), // Reducimos el espacio entre el TextField anterior y el siguiente
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Apellido',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0), // Reducimos el espacio entre el TextField anterior y el siguiente
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8.0), // Reducimos el espacio entre el TextField anterior y el siguiente
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 8.0), // Reducimos el espacio entre el TextField anterior y el siguiente
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirmar contraseña',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    CustomButton( // Usamos el widget CustomButton
                      color: Colors.blue, // Color personalizable según tus preferencias
                      iconVisible: false,
                      textColor: Colors.white, // Color del texto
                      text: 'Crear cuenta',
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
