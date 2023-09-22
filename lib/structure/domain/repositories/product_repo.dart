
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';

abstract class ProductRepository{
  void getProducts(Function(BaseRp) onData);
  // Future<String> getTeacher();
}