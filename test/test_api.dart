import 'package:dio/dio.dart';
import 'package:rapexa_academy/infrastructure/network/http_config.dart';
import 'package:rapexa_academy/structure/data/datasources/remote/product_db_remote.dart';
import 'package:rapexa_academy/structure/data/repositories/product_repo_impl.dart';
import 'package:rapexa_academy/structure/domain/usecases/product_usecase.dart';

main() async {
  Dio dio =  await HttpConfig.build();
  ProductUseCase productUseCase = ProductUseCase(
    ProductRepositoryImpl(
      ProductDBRemote(
        dio
      )
    )
  );

  productUseCase.list(loading: (){
    print("Loading");
  }, error: (failure){
    print("error" + failure.message!);
  }, success: (rp){
    print("success" + (rp.list![0].description ?? "NULL"));
  });

}