import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/constants/routes.dart';
import 'package:rapexa_academy/infrastructure/widgets/app_snackbar.dart';
import 'package:rapexa_academy/structure/data/models/response/get_posts_rp.dart';
import 'package:rapexa_academy/structure/domain/usecases/post_usecase.dart';

class PostController extends GetxController {
  final PostUseCase _useCase;

  PostController(this._useCase);

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  late Post selectedPost;

  void gotoDetailPage(Post product){
    selectedPost = product;
    Get.toNamed(POST_DETAIL_ROUTE);
  }


  GetPostsRp? rp;
  void getPosts() {
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

  String getPostImageUrl(Post post){
    if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.medium?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.medium!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.img120120?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.img120120!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.full?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.full!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.m1536x1536?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.m1536x1536!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.m2048x2048?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.m2048x2048!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.large?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.large!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].mediaDetails?.sizes?.mediumLarge?.sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].mediaDetails!.sizes!.mediumLarge!.sourceUrl!;
    }else if(post.eEmbedded?.wpFeaturedmedia?[0].sourceUrl != null){
      return post.eEmbedded!.wpFeaturedmedia![0].sourceUrl!;
    }
    return "https://rapexa.ir/wp-content/uploads/2023/04/rapexa-logo.png";
  }
  
}
