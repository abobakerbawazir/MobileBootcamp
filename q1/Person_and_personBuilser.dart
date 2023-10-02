// class Person {
//   late String firstName, lastName;
//   int? age;
//   String? profession;
//   List<String> hobbies = [];

//   Person(PersonBuilder builder) {
//     this.firstName = builder.firstName;
//     this.lastName = builder.lastName;
//     this.profession = builder.profession;
//     this.age = builder.age;
//     this.hobbies = builder.hobbies;
//   }
// }

// class PersonBuilder {
//   late String firstName, lastName;
//   int? age;
//   String? profession;
//   List<String> hobbies = [];
//   PersonBuilder({
//     required this.firstName,
//     required this.lastName,
//   });
//   PersonBuilder setage(int age) {
//     if (age < 0) {
//       throw Exception("age cannot be less than 0");
//     } else {
//       this.age = age;
//       return this;
//     }
//   }

//   PersonBuilder setprofession(String profession) {
//     if (profession == "") {
//       throw Exception;
//     } else {
//       this.profession = profession;
//       return this;
//     }
//   }

//   PersonBuilder setHobbies(List<String> hobbies) {
    
//     this.hobbies = hobbies;
//     return this;
//   }

//   build() {
//     return Person(PersonBuilder(firstName: firstName, lastName: lastName));
//   }
// }
