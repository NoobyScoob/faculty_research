import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const url = "https://faculty-research-server.herokuapp.com";

  Future<bool> postWorkshopForm(Map<String, dynamic> formData, String filePath) async {
    var uri = Uri.parse(url + "/workshop");
    var request = http.MultipartRequest("POST", uri);
    formData.forEach((k, v) {
      request.fields[k] = v.toString();
    });
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    var response = await request.send();
    print(response.statusCode);
    return response.statusCode == 200;
  }

  Future<bool> postConferenceForm(Map<String, dynamic> formData) async {
    var uri = Uri.parse(url + "/conference");
    var jsonFormData = jsonEncode(formData);
    var response = await http.post(uri, headers: {
      "Content-Type": "application/json"
    }, body: jsonFormData);
    print(response.statusCode);
    return response.statusCode == 200;
  }

  Future<bool> postJournalForm(Map<String, dynamic> formData) async {
    var uri = Uri.parse(url + "/journal");
    var jsonFormData = jsonEncode(formData);
    var response = await http.post(uri, headers: {
      "Content-Type": "application/json"
    }, body: jsonFormData);
    print(response.statusCode);
    return response.statusCode == 200;
  }
}