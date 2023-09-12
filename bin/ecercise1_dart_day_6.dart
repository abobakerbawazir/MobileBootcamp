// import 'package:ecercise1_dart_day_6/ecercise1_dart_day_6.dart' as ecercise1_dart_day_6;

// void main(List<String> arguments) {
//   print('Hello world: ${ecercise1_dart_day_6.calculate()}!');
// }
String get usecase => "Am I am useless? true";

//enum way 

enum OperatingSystem {
  uselessSingleton(true);

  const OperatingSystem(this.canBuildForIos);
  final bool canBuildForIos;

        String get usecase => "Am I am useless? $canBuildForIos";
}

//same result
void main(){
  print(usecase);
print(OperatingSystem.uselessSingleton.usecase);
}
