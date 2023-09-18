class person {
  //id first name, last name
  late String _id;
  late String _firstname;
  late String _lastname;
  person({required String id,required String firstname,required  String lastname}){
    this._id=id.toUpperCase();
    this._firstname=firstname;
    this._lastname=lastname;
  }
  String get Id {
    return _id;
  }

 void set Id(String id) {
    this._id = id;
  }
  ///
  String get Firstname {
    return _firstname;
  }

 void set Firstname(String firstname) {
    this._firstname = firstname;
  }
  ///
  String get Lastname {
    return _lastname;
  }

 void set Lastname(String lastname) {
    this._lastname = lastname;
  }
  displayinfo(){
    return "id = $_id ,first name = $_firstname , last name $_lastname";
  }


}
