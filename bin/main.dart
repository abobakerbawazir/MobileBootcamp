import 'dart:math';

import 'Category.dart';
import 'Person.dart';
import 'Searchgenericclass.dart';
import 'client.dart';
import 'pharmacist.dart';
import 'suppliers.dart';

void main(List<String> args) {
  Category category1 = Category(name: "Category 1");
  Category category2 = Category(name: "Category 2");
  Category category3 = Category(name: "Category 3");
  Category category4 = Category(name: "Category 4");
  Suppliers s = Suppliers.person(
      name: "1Supplier 1", mobile: 77888905430, companyName: "Company ");
  Client c = Client.person(
      name: " 1Client 1",
      mobile: 77888905430,
      address: "Address 1",
      Birth_Date: "14/9/1998");
  List<pharmacist> p = List.generate(
      10,
      (index) => pharmacist.person(
          name: "1Pharmacist 1", mobile: 77888905430, salary: 0.0));
  c.displayinformation();
  s.displayinformation();

  p.forEach((element) {
    print(element.id);
    print(element.name);
    print(element.mobile);
    print(element.salary);
  });

  
}
