import 'HostelModel.dart';

class HostelController {
  List<Hostel> hostels = [];



  void checkIn(Hostel hostelName, String roomNumber) {
    Hostel hostel = findHostel(hostelName);
    if (hostel != null) {
      hostel.rooms.add(roomNumber);
      print("Checked in successfully.");
    } else {
      print("Hostel not found. Check-in failed.");
    }
  }

  void checkOut(Hostel hostelName, String roomNumber) {
    Hostel hostel = findHostel(hostelName);
    if (hostel != null) {
      hostel.rooms.remove(roomNumber);
      print("Checked out successfully.");
    } else {
      print("Hostel not found. Check-out failed.");
    }
  }
  findHostel(Hostel h) {
    for (Hostel hostel in hostels) {
      if (hostel.roomNumber == findHostel) {
        return hostel;
      }
    }
    
  }

  // void checkIn(String hostelName, String roomNumber) {
  //   Hostel hostel = Hostel();
  //   if (hostel != null) {
  //     hostel.rooms.add(roomNumber);
  //     print("Checked in successfully.");
  //   } else {
  //     print("Hostel not found. Check-in failed.");
  //   }
  // }

  // void checkOut(String hostelName, String roomNumber) {
  //   Hostel hostel = Hostel();
  //   if (hostel != null) {
  //     hostel.rooms.remove(roomNumber);
  //     print("Checked out successfully.");
  //   } else {
  //     print("Hostel not found. Check-out failed.");
  //   }
  // }
}
