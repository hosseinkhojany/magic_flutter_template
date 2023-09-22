import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/get_posts_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';
import 'package:rapexa_academy/structure/domain/repositories/post_repo.dart';
import 'package:rapexa_academy/structure/domain/repositories/product_repo.dart';


class PostUseCase{

  final PostRepository _repository;
  PostUseCase(this._repository);

  void list(
      {required Function() loading,
        required Function(Failure) error,
        required Function(GetPostsRp) success,
      }) async {
    loading.call();
    _repository.getPosts((rp){
      if(rp is Failure){
        error.call(rp);
      }else if(rp is GetPostsRp){
        success.call(rp);
      }else{
        //todo check if what happen if throwing failure
        throw Failure();
      }
    });
  }

}