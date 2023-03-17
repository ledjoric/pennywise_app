import 'package:pennywise_app/app/models/user_data.dart';

class ConnectionsData {
  List<UserData> users = [];

  ConnectionsData({required this.users});

  ConnectionsData.fromJson(Map<String, dynamic> json) {
    List<UserData> usersList = [];
    for (var connectionList in json['connections']) {
      for (var userDataJson in connectionList) {
        usersList.add(UserData.fromJson(userDataJson));
      }
    }
    users = usersList;
  }
}
