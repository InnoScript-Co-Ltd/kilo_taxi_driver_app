class Order {
  int id;
  String pickupAddress;
  String dropAddress;
  DateTime? pickupTime;
  DateTime? dropTime;

  Order({
    required this.id,
    required this.pickupAddress,
    required this.dropAddress,
    this.pickupTime,
    this.dropTime
  });
}
