import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';
import 'package:rapexa_academy/structure/domain/repositories/product_repo.dart';


class ProductUseCase{

  final ProductRepository _repository;
  ProductUseCase(this._repository);

  void list(
      {required Function() loading,
        required Function(Failure) error,
        required Function(GetProductsRp) success,
      }) async {
    loading.call();
    _repository.getProducts((rp){
      if(rp is Failure){
        error.call(rp);
      }else if(rp is GetProductsRp){
        success.call(rp);
      }else{
        //todo check if what happen if throwing failure
        throw Failure();
      }
    });
  }

  // void getTeacher(
  //     {required Function() loading,
  //       required Function(Failure) error,
  //       required Function(String) success,
  //     }) async {
  //   loading.call();
  //   BaseRp rp = await _repository.getProducts();
  //   if(rp is Failure){
  //     error.call(rp);
  //   }else if(rp is GetProductsRp){
  //     success.call(rp);
  //   }else{
  //     //todo check if what happen if throwing failure
  //     throw Failure();
  //   }
  // }

}