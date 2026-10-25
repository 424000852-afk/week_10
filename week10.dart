
import 'dart:async';

class Laptop {
  String brand;
  int ram;
  int storage;
  bool _isOn = false;

  Laptop(this.brand, this.ram, this.storage);

  bool get isOn => _isOn;

  void powerOn() {
    _isOn = true;
    print('$brand laptop is now ON.');
  }

  void runProgram(String program) {
    if (_isOn) {
      print('$brand is running $program.');
    } else {
      print('$brand is OFF. Turn it on first.');
    }
  }

  void shutDown() {
    _isOn = false;
    print('$brand laptop is now OFF.');
  }

  void displayInfo() {
    print('Brand: $brand');
    print('RAM: ${ram}GB');
    print('Storage: ${storage}GB SSD');
    print('Power: ${isOn ? "ON" : "OFF"}');
  }

  // NEW: Asynchronous method
  Future<String> saveDetails() async {
    print('Saving $brand laptop details...');

    await Future.delayed(Duration(seconds: 2));

    return '$brand laptop details saved successfully!';
  }
}


Future<void> main() async {
  Laptop laptop1 = Laptop('HP', 12, 500);
  Laptop laptop2 = Laptop('Lenovo', 8, 512);
  Laptop laptop3 = Laptop('Acer', 16, 1000);

  List<Laptop> laptops = [laptop1, laptop2, laptop3];

  for (Laptop laptop in laptops) {
    laptop.displayInfo();
    laptop.powerOn();
    laptop.runProgram('Google Chrome');
    laptop.shutDown();

    print('Requesting async save for ${laptop.brand}...');

    Future<String> saveFuture = laptop.saveDetails();

    print('Main continues while saving ${laptop.brand}...');

    String result = await saveFuture;
    print(result);

    print('----------------');
  }
}
