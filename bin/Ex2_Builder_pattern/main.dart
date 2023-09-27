// void main(List<String> args) {
//   Set<String> y = {"s", "s", "s", "a"};
//   print(y);
//   print(y.length);
//   String x = Volume.L.name;
//   print(x);
// }

// enum Volume { M, S, L }
import 'Pizza.dart';

void main(List<String> args) {
  Pizza p = Pizza(size: Volume.M.name);
  p.Toppings = {"anchovies", "caviar","diamonds"};
  p.toString();
  Pizza p1 = Pizza(size: Volume.S.name);
  p1.Toppings = {"pepperoni"};
  p1.toString();
}
