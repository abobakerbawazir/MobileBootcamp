/*1- We applied principle Single responsiple Each method has only one action 
2- We applied principle Open_Closed method has ploygramipsm
3- We applied principle Liskov substitution all Any Super class Message of method, then used method of Super on  Conncrete class
*/
abstract class Fly{
  void fly();
}
abstract class Animal {
  void makeSound();

  void walk();

  void eat();

  
}

class Cat extends Animal {
  @override
  void eat() {
    // implement eat
  }

  @override
  void makeSound() {
    // implement makeSound
  }

  @override
  void walk() {
    // implement walk
  }
}

class Dog extends Animal {
  @override
  void eat() {
    // implement eat
  }

  @override
  void makeSound() {
    // implement makeSound
  }

  @override
  void walk() {
    // implement walk
  }
}

class Bird extends Animal implements Fly{
  @override
  void eat() {
    // implement eat
  }

  @override
  void fly() {
    // implement fly
  }

  @override
  void walk() {
    // implement walk
  }

  @override
  void makeSound() {
    // implement makeSound
  }
}

void main() {}