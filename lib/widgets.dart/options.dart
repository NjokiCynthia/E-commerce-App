import 'package:ecommerce/constants/color_constants.dart';
import 'package:ecommerce/models/options.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final Option option;
  final VoidCallback onRemove;
  final VoidCallback onDone;

  OptionWidget(
      {required this.option, required this.onRemove, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: greyLightColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: option.isDone
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: onRemove,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    children: option.values
                        .map((value) => Chip(
                              label: Text(value),
                            ))
                        .toList(),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Option: ${option.name}'),
                  Wrap(
                    spacing: 8.0,
                    children: option.values
                        .map((value) => Chip(
                              label: Text(value),
                            ))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: onRemove,
                      ),
                      ElevatedButton(
                        onPressed: onDone,
                        child: Text('Done'),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
