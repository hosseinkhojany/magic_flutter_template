import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/routes.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_snackbar.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';
import 'package:rapexa_academy/structure/domain/usecases/product_usecase.dart';

class ProductController extends GetxController {
  final ProductUseCase _useCase;

  ProductController(this._useCase);

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  late Product selectedProduct;

  void goToDetailPage(Product product){
    selectedProduct = product;
    Get.toNamed(PRODUCT_DETAIL_ROUTE);
  }


  GetProductsRp? rp;
  void getProduct() {
    _useCase.list(
      loading: () {
        AppSnackBar.showLoading();
        update();
      },
      error: (error) {
        AppSnackBar.showError(error.message);
        update();
      },
      success: (rp) async {
        this.rp = rp;
        AppSnackBar.dismissLoading();
        update();
      },
    );
  }

  
}
