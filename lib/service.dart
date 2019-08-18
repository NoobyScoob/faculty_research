import 'package:http/http.dart' as http;

class HttpService {
  static const url = "http://0edeb709.ngrok.io";

  Future<bool> postWorkshopForm(Map<String, dynamic> formData, String filePath) async {
    var uri = Uri.parse(url + "/workshop");
    var request = http.MultipartRequest("POST", uri);
    formData.forEach((k, v) {
      request.fields[k] = v.toString();
    });
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}