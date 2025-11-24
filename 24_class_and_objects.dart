// Class and object

class Car {
  // Properties
  String ? make;
  String ? model;
  int ?  year;

  // Constructor
  Car(this.make, this.model, this.year);

  // Method
  void displayInfo() {
    print('Car: $year $make $model');
  }
}

void main() {
  // Creating an object of the Car class
  Car myCar = Car('Toyota', 'Corolla', 2020);

  // Calling the method to display car information
  myCar.displayInfo();
}


