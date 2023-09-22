
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';

abstract class PostRepository{
  void getPosts(Function(BaseRp) onData);
  // Future<String> getTeacher();
}