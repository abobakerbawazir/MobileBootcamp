class Bill {
  //s private doctorFees, pharmacyChargesFees, roomRentFees discount
  late double _doctorFees;
  late double _pharmacyChargesFees;
  late double _roomRentFees;
  late double _discount;
  Bill(
      {required double doctorFees,
      required double pharmacyChargesFees,
      required double roomRentFees,
      required double discount}) {
    this._doctorFees = doctorFees;
    this._pharmacyChargesFees = pharmacyChargesFees;
    this._roomRentFees = roomRentFees;
    this._discount = discount;
  }
  double get DoctorFees {
    return _doctorFees;
  }

  void set DoctorFees(double doctorFees) {
    this._doctorFees = doctorFees;
  }

  //
  double get PharmacyChargesFees {
    return _pharmacyChargesFees;
  }

  void set PharmacyChargesFees(double pharmacyChargesFees) {
    this._pharmacyChargesFees = pharmacyChargesFees;
  }

  //
  double get RoomRentFees {
    return _roomRentFees;
  }

  void set RoomRentFees(double roomRentFees) {
    this._roomRentFees = roomRentFees;
  }

  //
  double get Discount {
    return _discount;
  }

  void set Discount(double discount) {
    this._discount = discount;
  }

  //
  displayinfoBill() {
    return "doctorFees = $_doctorFees ,pharmacyChargesFees = $_pharmacyChargesFees , roomRentFees $_roomRentFees , discount $_discount";
  }

  void getBillTotalAmount(int age) {
    double x = 0;
    double y = 0;
    if (age >= 50) {
      print(
          "the total before discount =${_doctorFees + _pharmacyChargesFees + _roomRentFees}");
      y = (_doctorFees + _pharmacyChargesFees + _roomRentFees) * (30 / 100);
      x = (_doctorFees + _pharmacyChargesFees + _roomRentFees);

      x = x - y;
      print("the discount =$y");
      print("the total after discount =$x");
    } else {
      x = _doctorFees + _pharmacyChargesFees + _roomRentFees;
      print(" the total =$x");
    }
  }
}
