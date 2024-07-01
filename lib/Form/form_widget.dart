import 'package:flutter/material.dart';

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? dropdownValue;
  bool agreeToTerms = false;

  void submitForm() {
    if (formKey.currentState!.validate() && agreeToTerms) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Choose an option'),
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an option';
                }
                return null;
              },
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              onSaved: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Agree to Terms'),
              value: agreeToTerms,
              onChanged: (bool? newValue) {
                setState(() {
                  agreeToTerms = newValue ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              subtitle: !agreeToTerms
                  ? Text(
                      'You must agree to terms',
                      style: TextStyle(color: Colors.red),
                    )
                  : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitForm,
              child: Text('Submit'),
            ),
            Text(
                'Form submitted. Name: $name, Selected option: $dropdownValue, Agreed to terms: $agreeToTerms')
          ],
        ));
  }
}
