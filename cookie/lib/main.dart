import 'package:cooky/cooky.dart' as cookie;

void main() async {
  // Create a session cookie:
  cookie.set('key1', 'Carlos');

  // Create a cookie that expires in a week:
  cookie.set('key2', 'Fernando', maxAge: const Duration(days: 7));

  // Create a cookie that is valid for a certain path and domain:
  cookie.set('key3', 'value', path: '/test', domain: 'test.com');

  // Read a cookie:
  var value1 = cookie.get('key1');
  // ignore: avoid_print
  print(value1);

  // Read a cookie:
  var value2 = cookie.get('key1');
  // ignore: avoid_print
  print(value2);

  // Delete a cookie:
//  cookie.remove('key');
}
