import 'package:ecommerce/constants/utils.dart';
import 'package:ecommerce/models/options.dart';
import 'package:flutter/material.dart';

class AddOptionScreen extends StatefulWidget {
  const AddOptionScreen({super.key});

  @override
  _AddOptionScreenState createState() => _AddOptionScreenState();
}

class _AddOptionScreenState extends State<AddOptionScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  List<String> values = [];

  void addValue() {
    if (valueController.text.isNotEmpty) {
      setState(() {
        values.add(valueController.text);
        valueController.clear();
      });
    }
  }

  void removeValue(String value) {
    setState(() {
      values.remove(value);
    });
  }

  void saveOption() {
    if (nameController.text.isNotEmpty && values.isNotEmpty) {
      final newOption = Option()
        ..name = nameController.text
        ..values = values;
      Navigator.pop(context, newOption);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Option'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: customInputDecoration(labelText: 'Option Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: valueController,
              decoration: customInputDecoration(labelText: 'Option Value'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: addValue,
                  child: const Text('Add Value'),
                ),
                ElevatedButton(
                  onPressed: saveOption,
                  child: const Text('Save Option'),
                ),
              ],
            ),
            Wrap(
              spacing: 6.0,
              children: values
                  .map((value) => Chip(
                        label: Text(value),
                        deleteIcon: const Icon(Icons.cancel),
                        onDeleted: () => removeValue(value),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
