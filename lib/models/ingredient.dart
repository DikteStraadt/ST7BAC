class Ingredient {
  late String name;
  double? amount;
  String? unit;

  Ingredient(this.name, this.amount, this.unit);

  Ingredient.json({
    required this.name,
    this.amount,
    this.unit,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'unit': unit,
      };

  factory Ingredient.fromJson(Map<dynamic, dynamic> json) => Ingredient.json(
      name: json['name'], amount: json['amount'], unit: json['unit']);
}
