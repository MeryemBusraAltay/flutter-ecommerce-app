import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String apiUrl = 'https://wantapi.com/products.php';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        List<dynamic> productsList = body['data'];
        List<Product> products = productsList
            .map((dynamic item) => Product.fromJson(item))
            .toList();
        return products;
      } else {
        throw Exception(
          'Ürünler yüklenemedi. Hata Kodu: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }
}
