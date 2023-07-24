import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class FormValue {
  int id = 0;
  int? eins = 0;
  int? zwo = 0;
  FormValue({this.eins, this.zwo});
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var formValue = FormValue();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Moin'),
          TextFormField(
              validator: (value) =>
                  (value == null || value.isEmpty) ? 'Whäääää!' : null,
              restorationId: 'eins',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: 'Mach Zahl! Diggi'),
              onChanged: (value) => formValue.eins = int.parse(value)),
          TextFormField(
              validator: (value) =>
                  (value == null || value.isEmpty) ? 'Whäääää!' : null,
              restorationId: 'zwo',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.numberWithOptions(),
              decoration:
                  InputDecoration(hintText: 'Mach noch mehr Zahl! Diggi'),
              onChanged: (value) => formValue.zwo = int.parse(value)),
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sending Pending Data')),
                );
                http.post(Uri.parse('http://10.0.2.2:3000/foo'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode({
                      "id": formValue.eins,
                      "eins": formValue.eins,
                      "zwo": formValue.zwo,
                    }));
              }
            },
            icon: Icon(
              Icons.save,
              color: Colors.orangeAccent,
              size: 24.0,
              semanticLabel: 'Foo Bar',
            ),
          ),
        ],
      ),
    );
  }
}
