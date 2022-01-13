import 'package:atlanta_demo/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static Future<List<User>> getUser() async {
    var userApi = UserApi();
    return await userApi.getUser();
  }
}

abstract class NetworkCall {
  Future<List<User>> getUser();
}

class UserApi extends NetworkCall {
  @override
  Future<List<User>> getUser() async {
    try {
      var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
      var response = await http.get(uri);
      var userList = usersFromJson(response.body);
      return userList;
    } catch (e) {
      print('error $e');
      return List<User>.empty();
    }
  }
}
