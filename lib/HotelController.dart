
import 'HotelModel.dart';
class HotelController{
  List<HotelModel>_allProducts=[];
  List<Map<String,dynamic>>data=[{
    "id": 1,
    "title": "iPhone 9",
    "description": "An apple",
    "thumbnail": "assets/images/s1.jpg"
  },
    {
      "id": 2,
      "title": "iPhone X",
      "description": "SIM-",
      "thumbnail": "assets/images/s1.jpg",

    },
    {
      "id": 3,
      "title": "Samsung ",
      "description": "1",
      
      
      "thumbnail": "assets/images/s1.jpg",

    },
    {
      "id": 4,
      "title": "Samsung 9",
      "description": "Samsung's ",
      
      
      "thumbnail": "assets/images/s1.jpg",

    },
    {
      "id": 5,
      "title": "Samsung",
      "description": "Samsung's",
      
      
      "thumbnail": "assets/images/s1.jpg",

    },
    {
      "id": 6,
      "title": "Samsung",
      "description": "Samsung's",
      
      
      "thumbnail": "assets/images/s1.jpg",

    },
    

  ];

    getAllProducts(){
      data.forEach((element) {
        HotelModel model=HotelModel.fromJson(element);
        _allProducts.add(model);
      });


    }
    List<HotelModel> get products=>_allProducts;
}