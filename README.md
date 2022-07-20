# day10

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/60324587/179899616-64f8ad9b-2b62-47c2-a5f2-5f34d7a39c68.png">

What did I lear today - what was new?
```
import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToApi() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);
    return response.body;
  }
}
```
### in order for us to receive data from internet we need to use http package
### work with simple async and awaits 
```
final _dataService = DataService();
  String? _response;
void makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() {
      _response = response.toString();
    });
  }
```
