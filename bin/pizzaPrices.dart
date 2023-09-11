void main(){
    const pizzaPrices = {
 'margherita': 5.5,
 'pepperoni': 7.5,
 'vegetarian': 6.5,
};
const order = ['margherita', 'pepperoni'];
  dynamic total=0;
  order.forEach((x){
    total=total+pizzaPrices[x];
  });
  print("total : \$"+total.toString());
}