import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/network/http_config.dart';
import 'package:rapexa_academy/structure/data/datasources/remote/login_db_remote.dart';
import 'package:rapexa_academy/structure/data/datasources/remote/post_db_remote.dart';
import 'package:rapexa_academy/structure/data/datasources/remote/product_db_remote.dart';
import 'package:rapexa_academy/structure/data/repositories/login_repo_impl.dart';
import 'package:rapexa_academy/structure/data/repositories/post_repo_impl.dart';
import 'package:rapexa_academy/structure/data/repositories/product_repo_impl.dart';
import 'package:rapexa_academy/structure/domain/usecases/login_usecase.dart';
import 'package:rapexa_academy/structure/domain/usecases/post_usecase.dart';
import 'package:rapexa_academy/structure/domain/usecases/product_usecase.dart';
import 'package:rapexa_academy/structure/presenter/login_controller.dart';
import 'package:rapexa_academy/structure/presenter/post_controller.dart';
import 'package:rapexa_academy/structure/presenter/product_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(await HttpConfig.build());
    Get.lazyPut(
      () => LoginController(
        LoginUseCase(
          LoginRepositoryImpl(
            LoginDataSourceRemote(
              Get.find(),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => ProductController(
        ProductUseCase(
          ProductRepositoryImpl(
            ProductDBRemote(
              Get.find(),
            ),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => PostController(
        PostUseCase(
          PostRepositoryImpl(
            PostDBRemote(
              Get.find(),
            ),
          ),
        ),
      ),
    );
  }
}
