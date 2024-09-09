import 'package:ecommerce/constants/color_constants.dart';
import 'package:ecommerce/constants/utils.dart';
import 'package:ecommerce/models/options.dart';
import 'package:ecommerce/models/variants.dart';
import 'package:ecommerce/screens/add_options.dart';
import 'package:ecommerce/widgets.dart/options.dart';
import 'package:flutter/material.dart';

class ProductVariantsScreen extends StatefulWidget {
  @override
  _ProductVariantsScreenState createState() => _ProductVariantsScreenState();
}

class _ProductVariantsScreenState extends State<ProductVariantsScreen> {
  List<Option> options = [];
  List<Variant> variants = [];

  // Navigate to the add options page
  Future<void> navigateToAddOption() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddOptionScreen()),
    );

    if (result != null && result is Option) {
      setState(() {
        options.add(result);
      });
    }
  }

  void generateVariants() {
    List<List<String>> optionValues =
        options.map((option) => option.values).toList();
    List<String> generatedVariants = _generateVariants(optionValues);
    setState(() {
      variants = generatedVariants
          .map((variant) => Variant(name: variant, isSelected: false))
          .toList();
    });
  }

  List<String> _generateVariants(List<List<String>> lists) {
    if (lists.isEmpty) return [];

    return lists.reduce((list1, list2) {
      return list1
          .expand((item) => list2.map((item2) => "$item, $item2"))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product Variants'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Title',
              style: MyTheme.darkTheme.textTheme.headlineMedium!
                  .copyWith(color: secondaryDarkColor),
            ),
            SizedBox(height: 2),
            TextFormField(
                decoration: customInputDecoration(labelText: 'Title')),
            SizedBox(height: 5),
            Text(
              'Product Description',
              style: MyTheme.darkTheme.textTheme.headlineMedium!
                  .copyWith(color: secondaryDarkColor),
            ),
            SizedBox(height: 2),
            TextFormField(
              decoration: customInputDecoration(labelText: 'Enter description'),
              maxLines: null,
              //minLines: 2,
              keyboardType: TextInputType.multiline,
            ),
            // Options section
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return OptionWidget(
                    option: options[index],
                    onRemove: () {
                      setState(() {
                        options.removeAt(index);
                      });
                    },
                    onDone: () {
                      setState(() {
                        options[index].isDone = true;
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: navigateToAddOption,
                  child: Text('Add Option'),
                ),
                ElevatedButton(
                  onPressed: generateVariants,
                  child: Text('Generate Variants'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Generated Variants:'),
                Text(
                    '${variants.where((variant) => variant.isSelected).length} selected'),
              ],
            ),
            // Display generated variants as checkboxes with price and quantity
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: variants.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: variants[index].isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            variants[index].isSelected = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(variants[index].name),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          decoration: customInputDecoration(
                            labelText: 'Price',
                          ),
                          onChanged: (value) {
                            variants[index].price = value;
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: customInputDecoration(labelText: ''),
                              controller: TextEditingController(
                                  text: variants[index].quantity),
                              onChanged: (value) {
                                variants[index].quantity = value;
                              },
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_up),
                                onPressed: () {
                                  setState(() {
                                    int currentQty = int.tryParse(
                                            variants[index].quantity) ??
                                        0;
                                    variants[index].quantity =
                                        (currentQty + 1).toString();
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () {
                                  setState(() {
                                    int currentQty = int.tryParse(
                                            variants[index].quantity) ??
                                        0;
                                    if (currentQty > 0) {
                                      variants[index].quantity =
                                          (currentQty - 1).toString();
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Add edit functionality
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
