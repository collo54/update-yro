class CheckoutItem {
  CheckoutItem(
      {this.productname,
      this.description,
      this.timeStamp,
      this.price,
      required this.id,
      this.userId,
      this.quantity,
      this.promocode,
      this.downloadUrl});

  final String? productname;
  final double? quantity;
  final String? description;
  final String? timeStamp;
  final double? price;
  final String? userId;
  final String? downloadUrl;
  final String? promocode;
  final String id;

  factory CheckoutItem.fromMap(Map<String, dynamic> data, String id) {
    final double? price = data['price'];
    final String? timeStamp = data['timeStamp'];
    final String? description = data['description'];
    final String? userId = data['userId'];
    final String? productname = data['productname'];
    final double? quantity = data['quantity'];
    final String? downloadUrl = data['downloadUrl'];
    final String? promocode = data['promocode'];

    return CheckoutItem(
      id: id,
      quantity: quantity,
      promocode: promocode,
      description: description,
      price: price,
      productname: productname,
      timeStamp: timeStamp,
      userId: userId!,
      downloadUrl: downloadUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
      'description': description,
      'quantity': quantity,
      'price': price,
      'userId': userId,
      'productname': productname,
      'timeStamp': timeStamp,
      'promocode': promocode,
    };
  }
}
