import 'package:app_inventory/dtos/login_response.dart';
import 'package:app_inventory/models/api/login.dart';
import 'package:app_inventory/services/api_service.dart';
import 'package:http/http.dart';

class SesionService {
  static Future<LoginResponse?> login(Login login) async {
    Uri uri = Uri.http(ApiService.urlBase, '/app_inventory/login');

    Response response = await ApiService.post(uri, login.toJson());

    if (response.statusCode != 200) {
      return null;
    }

    var decodeResponse = ApiService.decodeResponse(response);

    LoginResponse loginResponse = LoginResponse.fromJson(decodeResponse);

    return loginResponse;
  }

  static Future<bool> logout() async {
    Uri uri = Uri.http(ApiService.urlBase, '/app_inventory/logout');

    Response response = await ApiService.postWithoutBody(uri);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
