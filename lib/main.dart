import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulaire'),
        ),
        body: MyForm(),
      ),
    );
  }
}
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool? _termsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Veuillez entrer un nom d\'utilisateur';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _termsChecked,
                  onChanged: (value) {
                    setState(() {
                      _termsChecked = value;
                    });
                  },
                ),
                Text('J\'accepte les termes et conditions'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false && _termsChecked == true) {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                
                }
              },
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}