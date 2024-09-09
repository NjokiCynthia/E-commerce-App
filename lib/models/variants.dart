

class Variant {
  String name;
  bool isSelected;
  String price;
  String quantity;

  Variant({
    required this.name,
    this.isSelected = false,
    this.price = '',
    this.quantity = '',
  });
}