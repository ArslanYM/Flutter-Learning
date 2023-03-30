class Vehicle {
  String model;
  int year;

  Vehicle(this.model, this.year);

  showOutput() {
    print(model);
    print(year);
  }
}

class Car extends Vehicle {
  double price;

  Car(String model, int year, this.price)
      : super(model,
            year); //super keyword is used to call the constructor of the parent class

  showOutput() {
    super.showOutput();
    print(price);
  }
}

void main(List<String> args) {
  var car1 = Car('Accord', 2014, 150000);
  car1.showOutput();
}
