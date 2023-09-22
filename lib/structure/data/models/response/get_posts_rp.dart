import 'package:get/get.dart';
import 'package:rapexa_academy/infrastructure/network/base/base_rp.dart';

class GetPostsRp extends BaseRp {
  List<Post>? list;

  GetPostsRp({this.list});

  GetPostsRp.fromJson(List<dynamic> json) {
    list = [];
    for (var value in json) {
      list!.add(Post.fromJson(value));
    }
  }

  List<dynamic> toJson() {
    List<dynamic> data = [];
    if (list != null) {
      data = (list!.map((product) => product.toJson()).toList());
    }
    return data;
  }
}

class Post {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  Meta? meta;
  List<int>? categories;

  // List<String>? tags;
  Links? lLinks;
  Embedded? eEmbedded;

  Post(
      {this.id,
      this.date,
      this.dateGmt,
      this.guid,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.type,
      this.link,
      this.title,
      this.content,
      this.excerpt,
      this.author,
      this.featuredMedia,
      this.commentStatus,
      this.pingStatus,
      this.sticky,
      this.template,
      this.format,
      this.meta,
      this.categories,
      // this.tags,
      this.lLinks,
      this.eEmbedded});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    excerpt =
        json['excerpt'] != null ? Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    categories = json['categories'].cast<int>();
    // if (json['tags'] != null) {
    //   tags = <String>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
    eEmbedded =
        json['_embedded'] != null ? Embedded.fromJson(json['_embedded']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['date_gmt'] = dateGmt;
    if (guid != null) {
      data['guid'] = guid!.toJson();
    }
    data['modified'] = modified;
    data['modified_gmt'] = modifiedGmt;
    data['slug'] = slug;
    data['status'] = status;
    data['type'] = type;
    data['link'] = link;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (excerpt != null) {
      data['excerpt'] = excerpt!.toJson();
    }
    data['author'] = author;
    data['featured_media'] = featuredMedia;
    data['comment_status'] = commentStatus;
    data['ping_status'] = pingStatus;
    data['sticky'] = sticky;
    data['template'] = template;
    data['format'] = format;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['categories'] = categories;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    if (eEmbedded != null) {
      data['_embedded'] = eEmbedded!.toJson();
    }
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    return data;
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    data['protected'] = protected;
    return data;
  }
}

class Meta {
  String? footnotes;

  Meta({this.footnotes});

  Meta.fromJson(Map<String, dynamic> json) {
    footnotes = json['footnotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['footnotes'] = footnotes;
    return data;
  }
}

class Links {
  List<Self>? self;

  // List<Collection>? collection;
  // List<About>? about;
  List<Author>? author;

  // List<Replies>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<WpFeaturedmedia>? wpFeaturedmedia;

  // List<WpAttachment>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Curies>? curies;

  Links(
      {this.self,
      // this.collection,
      // this.about,
      this.author,
      // this.replies,
      this.versionHistory,
      this.predecessorVersion,
      this.wpFeaturedmedia,
      // this.wpAttachment,
      this.wpTerm,
      this.curies});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(Self.fromJson(v));
      });
    }
    // if (json['collection'] != null) {
    //   collection = <Collection>[];
    //   json['collection'].forEach((v) {
    //     collection!.add(new Collection.fromJson(v));
    //   });
    // }
    // if (json['about'] != null) {
    //   about = <About>[];
    //   json['about'].forEach((v) {
    //     about!.add(new About.fromJson(v));
    //   });
    // }
    if (json['author'] != null) {
      author = <Author>[];
      json['author'].forEach((v) {
        author!.add(Author.fromJson(v));
      });
    }
    // if (json['replies'] != null) {
    //   replies = <Replies>[];
    //   json['replies'].forEach((v) {
    //     replies!.add(new Replies.fromJson(v));
    //   });
    // }
    if (json['version-history'] != null) {
      versionHistory = <VersionHistory>[];
      json['version-history'].forEach((v) {
        versionHistory!.add(VersionHistory.fromJson(v));
      });
    }
    if (json['predecessor-version'] != null) {
      predecessorVersion = <PredecessorVersion>[];
      json['predecessor-version'].forEach((v) {
        predecessorVersion!.add(PredecessorVersion.fromJson(v));
      });
    }
    if (json['wp:featuredmedia'] != null) {
      wpFeaturedmedia = <WpFeaturedmedia>[];
      json['wp:featuredmedia'].forEach((v) {
        wpFeaturedmedia!.add(WpFeaturedmedia.fromJson(v));
      });
    }
    // if (json['wp:attachment'] != null) {
    //   wpAttachment = <WpAttachment>[];
    //   json['wp:attachment'].forEach((v) {
    //     wpAttachment!.add(new WpAttachment.fromJson(v));
    //   });
    // }
    if (json['wp:term'] != null) {
      wpTerm = <WpTerm>[];
      json['wp:term'].forEach((v) {
        wpTerm!.add(WpTerm.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      curies = <Curies>[];
      json['curies'].forEach((v) {
        curies!.add(Curies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    // if (this.collection != null) {
    //   data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    // }
    // if (this.about != null) {
    //   data['about'] = this.about!.map((v) => v.toJson()).toList();
    // }
    if (author != null) {
      data['author'] = author!.map((v) => v.toJson()).toList();
    }
    // if (this.replies != null) {
    //   data['replies'] = this.replies!.map((v) => v.toJson()).toList();
    // }
    if (versionHistory != null) {
      data['version-history'] = versionHistory!.map((v) => v.toJson()).toList();
    }
    if (predecessorVersion != null) {
      data['predecessor-version'] =
          predecessorVersion!.map((v) => v.toJson()).toList();
    }
    if (wpFeaturedmedia != null) {
      data['wp:featuredmedia'] =
          wpFeaturedmedia!.map((v) => v.toJson()).toList();
    }
    // if (this.wpAttachment != null) {
    //   data['wp:attachment'] =
    //       this.wpAttachment!.map((v) => v.toJson()).toList();
    // }
    if (wpTerm != null) {
      data['wp:term'] = wpTerm!.map((v) => v.toJson()).toList();
    }
    if (curies != null) {
      data['curies'] = curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class AuthorBlog {
  bool? embeddable;
  String? href;

  AuthorBlog({this.embeddable, this.href});

  AuthorBlog.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }
}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['href'] = href;
    return data;
  }
}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['href'] = href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;
  String? slug;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxonomy'] = taxonomy;
    data['embeddable'] = embeddable;
    data['href'] = href;
    data['slug'] = slug;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['href'] = href;
    data['templated'] = templated;
    return data;
  }
}

class Embedded {
  List<Author>? author;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  WpTerm? wpTerm;

  Embedded({this.author, this.wpFeaturedmedia, this.wpTerm});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['author'] != null) {
      author = <Author>[];
      json['author'].forEach((v) {
        author!.add(Author.fromJson(v));
      });
    }
    if (json['wp:featuredmedia'] != null) {
      wpFeaturedmedia = <WpFeaturedmedia>[];
      json['wp:featuredmedia'].forEach((v) {
        wpFeaturedmedia!.add(WpFeaturedmedia.fromJson(v));
      });
    }
    if (json['wp:term'] != null) {
      try {
        wpTerm = WpTerm.fromJson(json['wp:term'][0][0]);
      } catch (e) {
        wpTerm = WpTerm.fromJson(json['wp:term']);
        e.printError();
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (author != null) {
      data['author'] = author!.map((v) => v.toJson()).toList();
    }
    if (wpFeaturedmedia != null) {
      data['wp:featuredmedia'] =
          wpFeaturedmedia!.map((v) => v.toJson()).toList();
    }
    if (wpTerm != null) {
      data['wp:term'] = wpTerm!.toJson();
    }
    return data;
  }
}

class Author {
  int? id;
  String? name;
  String? url;
  String? description;
  String? link;
  String? slug;
  AvatarUrls? avatarUrls;
  bool? isSuperAdmin;
  WoocommerceMeta? woocommerceMeta;
  Links? lLinks;

  Author(
      {this.id,
      this.name,
      this.url,
      this.description,
      this.link,
      this.slug,
      this.avatarUrls,
      this.isSuperAdmin,
      this.woocommerceMeta,
      this.lLinks});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    description = json['description'];
    link = json['link'];
    slug = json['slug'];
    avatarUrls = json['avatar_urls'] != null
        ? AvatarUrls.fromJson(json['avatar_urls'])
        : null;
    isSuperAdmin = json['is_super_admin'];
    woocommerceMeta = json['woocommerce_meta'] != null
        ? WoocommerceMeta.fromJson(json['woocommerce_meta'])
        : null;
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['description'] = description;
    data['link'] = link;
    data['slug'] = slug;
    if (avatarUrls != null) {
      data['avatar_urls'] = avatarUrls!.toJson();
    }
    data['is_super_admin'] = isSuperAdmin;
    if (woocommerceMeta != null) {
      data['woocommerce_meta'] = woocommerceMeta!.toJson();
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class AvatarUrls {
  String? s24;
  String? s48;
  String? s96;

  AvatarUrls({this.s24, this.s48, this.s96});

  AvatarUrls.fromJson(Map<String, dynamic> json) {
    s24 = json['24'];
    s48 = json['48'];
    s96 = json['96'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['24'] = s24;
    data['48'] = s48;
    data['96'] = s96;
    return data;
  }
}

class WoocommerceMeta {
  String? variableProductTourShown;
  String? activityPanelInboxLastRead;
  String? activityPanelReviewsLastRead;
  String? categoriesReportColumns;
  String? couponsReportColumns;
  String? customersReportColumns;
  String? ordersReportColumns;
  String? productsReportColumns;
  String? revenueReportColumns;
  String? taxesReportColumns;
  String? variationsReportColumns;
  String? dashboardSections;
  String? dashboardChartType;
  String? dashboardChartInterval;
  String? dashboardLeaderboardRows;
  String? homepageLayout;
  String? homepageStats;
  String? taskListTrackedStartedTasks;
  String? helpPanelHighlightShown;
  String? androidAppBannerDismissed;

  WoocommerceMeta(
      {this.variableProductTourShown,
      this.activityPanelInboxLastRead,
      this.activityPanelReviewsLastRead,
      this.categoriesReportColumns,
      this.couponsReportColumns,
      this.customersReportColumns,
      this.ordersReportColumns,
      this.productsReportColumns,
      this.revenueReportColumns,
      this.taxesReportColumns,
      this.variationsReportColumns,
      this.dashboardSections,
      this.dashboardChartType,
      this.dashboardChartInterval,
      this.dashboardLeaderboardRows,
      this.homepageLayout,
      this.homepageStats,
      this.taskListTrackedStartedTasks,
      this.helpPanelHighlightShown,
      this.androidAppBannerDismissed});

  WoocommerceMeta.fromJson(Map<String, dynamic> json) {
    variableProductTourShown = json['variable_product_tour_shown'];
    activityPanelInboxLastRead = json['activity_panel_inbox_last_read'];
    activityPanelReviewsLastRead = json['activity_panel_reviews_last_read'];
    categoriesReportColumns = json['categories_report_columns'];
    couponsReportColumns = json['coupons_report_columns'];
    customersReportColumns = json['customers_report_columns'];
    ordersReportColumns = json['orders_report_columns'];
    productsReportColumns = json['products_report_columns'];
    revenueReportColumns = json['revenue_report_columns'];
    taxesReportColumns = json['taxes_report_columns'];
    variationsReportColumns = json['variations_report_columns'];
    dashboardSections = json['dashboard_sections'];
    dashboardChartType = json['dashboard_chart_type'];
    dashboardChartInterval = json['dashboard_chart_interval'];
    dashboardLeaderboardRows = json['dashboard_leaderboard_rows'];
    homepageLayout = json['homepage_layout'];
    homepageStats = json['homepage_stats'];
    taskListTrackedStartedTasks = json['task_list_tracked_started_tasks'];
    helpPanelHighlightShown = json['help_panel_highlight_shown'];
    androidAppBannerDismissed = json['android_app_banner_dismissed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variable_product_tour_shown'] = variableProductTourShown;
    data['activity_panel_inbox_last_read'] = activityPanelInboxLastRead;
    data['activity_panel_reviews_last_read'] = activityPanelReviewsLastRead;
    data['categories_report_columns'] = categoriesReportColumns;
    data['coupons_report_columns'] = couponsReportColumns;
    data['customers_report_columns'] = customersReportColumns;
    data['orders_report_columns'] = ordersReportColumns;
    data['products_report_columns'] = productsReportColumns;
    data['revenue_report_columns'] = revenueReportColumns;
    data['taxes_report_columns'] = taxesReportColumns;
    data['variations_report_columns'] = variationsReportColumns;
    data['dashboard_sections'] = dashboardSections;
    data['dashboard_chart_type'] = dashboardChartType;
    data['dashboard_chart_interval'] = dashboardChartInterval;
    data['dashboard_leaderboard_rows'] = dashboardLeaderboardRows;
    data['homepage_layout'] = homepageLayout;
    data['homepage_stats'] = homepageStats;
    data['task_list_tracked_started_tasks'] = taskListTrackedStartedTasks;
    data['help_panel_highlight_shown'] = helpPanelHighlightShown;
    data['android_app_banner_dismissed'] = androidAppBannerDismissed;
    return data;
  }
}

class WpFeaturedmedia {
  int? id;
  String? date;
  String? slug;
  String? type;
  String? link;
  Guid? title;
  int? author;
  Guid? caption;
  String? altText;
  String? mediaType;
  String? mimeType;
  MediaDetails? mediaDetails;
  String? sourceUrl;
  Links? lLinks;

  WpFeaturedmedia(
      {this.id,
      this.date,
      this.slug,
      this.type,
      this.link,
      this.title,
      this.author,
      this.caption,
      this.altText,
      this.mediaType,
      this.mimeType,
      this.mediaDetails,
      this.sourceUrl,
      this.lLinks});

  WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    slug = json['slug'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    author = json['author'];
    caption = json['caption'] != null ? Guid.fromJson(json['caption']) : null;
    altText = json['alt_text'];
    mediaType = json['media_type'];
    mimeType = json['mime_type'];
    mediaDetails = json['media_details'] != null
        ? MediaDetails.fromJson(json['media_details'])
        : null;
    sourceUrl = json['source_url'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['slug'] = slug;
    data['type'] = type;
    data['link'] = link;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['author'] = author;
    if (caption != null) {
      data['caption'] = caption!.toJson();
    }
    data['alt_text'] = altText;
    data['media_type'] = mediaType;
    data['mime_type'] = mimeType;
    if (mediaDetails != null) {
      data['media_details'] = mediaDetails!.toJson();
    }
    data['source_url'] = sourceUrl;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class MediaDetails {
  int? width;
  int? height;
  String? file;
  int? filesize;
  Sizes? sizes;
  ImageMeta? imageMeta;

  MediaDetails(
      {this.width,
      this.height,
      this.file,
      this.filesize,
      this.sizes,
      this.imageMeta});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    file = json['file'];
    filesize = json['filesize'];
    sizes = json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null;
    imageMeta = json['image_meta'] != null
        ? ImageMeta.fromJson(json['image_meta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['file'] = file;
    data['filesize'] = filesize;
    if (sizes != null) {
      data['sizes'] = sizes!.toJson();
    }
    if (imageMeta != null) {
      data['image_meta'] = imageMeta!.toJson();
    }
    return data;
  }
}

class Sizes {
  Medium? medium;
  Medium? large;
  Medium? thumbnail;
  Medium? mediumLarge;
  Medium? m1536x1536;
  Medium? m2048x2048;
  Medium? studiareImage420x294Croped;
  Medium? studiareImage400x400Croped;
  Medium? studiareCourseThumb;
  Medium? img120120;
  Medium? metroFirst;
  Medium? metroOthers;
  WoocommerceThumbnail? woocommerceThumbnail;
  Medium? woocommerceSingle;
  Medium? woocommerceGalleryThumbnail;
  Full? full;

  Sizes(
      {this.medium,
      this.large,
      this.thumbnail,
      this.mediumLarge,
      this.m1536x1536,
      this.m2048x2048,
      this.studiareImage420x294Croped,
      this.studiareImage400x400Croped,
      this.studiareCourseThumb,
      this.img120120,
      this.metroFirst,
      this.metroOthers,
      this.woocommerceThumbnail,
      this.woocommerceSingle,
      this.woocommerceGalleryThumbnail,
      this.full});

  Sizes.fromJson(Map<String, dynamic> json) {
    medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
    large = json['large'] != null ? Medium.fromJson(json['large']) : null;
    thumbnail =
        json['thumbnail'] != null ? Medium.fromJson(json['thumbnail']) : null;
    mediumLarge = json['medium_large'] != null
        ? Medium.fromJson(json['medium_large'])
        : null;
    m1536x1536 =
        json['1536x1536'] != null ? Medium.fromJson(json['1536x1536']) : null;
    m2048x2048 =
        json['2048x2048'] != null ? Medium.fromJson(json['2048x2048']) : null;
    studiareImage420x294Croped = json['studiare-image-420x294-croped'] != null
        ? Medium.fromJson(json['studiare-image-420x294-croped'])
        : null;
    studiareImage400x400Croped = json['studiare-image-400x400-croped'] != null
        ? Medium.fromJson(json['studiare-image-400x400-croped'])
        : null;
    studiareCourseThumb = json['studiare-course-thumb'] != null
        ? Medium.fromJson(json['studiare-course-thumb'])
        : null;
    img120120 = json['img-120-120'] != null
        ? Medium.fromJson(json['img-120-120'])
        : null;
    metroFirst = json['metro_first'] != null
        ? Medium.fromJson(json['metro_first'])
        : null;
    metroOthers = json['metro_others'] != null
        ? Medium.fromJson(json['metro_others'])
        : null;
    woocommerceThumbnail = json['woocommerce_thumbnail'] != null
        ? WoocommerceThumbnail.fromJson(json['woocommerce_thumbnail'])
        : null;
    woocommerceSingle = json['woocommerce_single'] != null
        ? Medium.fromJson(json['woocommerce_single'])
        : null;
    woocommerceGalleryThumbnail = json['woocommerce_gallery_thumbnail'] != null
        ? Medium.fromJson(json['woocommerce_gallery_thumbnail'])
        : null;
    full = json['full'] != null ? Full.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (mediumLarge != null) {
      data['medium_large'] = mediumLarge!.toJson();
    }
    if (m1536x1536 != null) {
      data['1536x1536'] = m1536x1536!.toJson();
    }
    if (m2048x2048 != null) {
      data['2048x2048'] = m2048x2048!.toJson();
    }
    if (studiareImage420x294Croped != null) {
      data['studiare-image-420x294-croped'] =
          studiareImage420x294Croped!.toJson();
    }
    if (studiareImage400x400Croped != null) {
      data['studiare-image-400x400-croped'] =
          studiareImage400x400Croped!.toJson();
    }
    if (studiareCourseThumb != null) {
      data['studiare-course-thumb'] = studiareCourseThumb!.toJson();
    }
    if (img120120 != null) {
      data['img-120-120'] = img120120!.toJson();
    }
    if (metroFirst != null) {
      data['metro_first'] = metroFirst!.toJson();
    }
    if (metroOthers != null) {
      data['metro_others'] = metroOthers!.toJson();
    }
    if (woocommerceThumbnail != null) {
      data['woocommerce_thumbnail'] = woocommerceThumbnail!.toJson();
    }
    if (woocommerceSingle != null) {
      data['woocommerce_single'] = woocommerceSingle!.toJson();
    }
    if (woocommerceGalleryThumbnail != null) {
      data['woocommerce_gallery_thumbnail'] =
          woocommerceGalleryThumbnail!.toJson();
    }
    if (full != null) {
      data['full'] = full!.toJson();
    }
    return data;
  }
}

class Medium {
  String? file;
  int? width;
  int? height;
  int? filesize;
  String? mimeType;
  String? sourceUrl;

  Medium(
      {this.file,
      this.width,
      this.height,
      this.filesize,
      this.mimeType,
      this.sourceUrl});

  Medium.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    filesize = json['filesize'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['width'] = width;
    data['height'] = height;
    data['filesize'] = filesize;
    data['mime_type'] = mimeType;
    data['source_url'] = sourceUrl;
    return data;
  }
}

class WoocommerceThumbnail {
  String? file;
  int? width;
  int? height;
  int? filesize;
  bool? uncropped;
  String? mimeType;
  String? sourceUrl;

  WoocommerceThumbnail(
      {this.file,
      this.width,
      this.height,
      this.filesize,
      this.uncropped,
      this.mimeType,
      this.sourceUrl});

  WoocommerceThumbnail.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    filesize = json['filesize'];
    uncropped = json['uncropped'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['width'] = width;
    data['height'] = height;
    data['filesize'] = filesize;
    data['uncropped'] = uncropped;
    data['mime_type'] = mimeType;
    data['source_url'] = sourceUrl;
    return data;
  }
}

class Full {
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;

  Full({this.file, this.width, this.height, this.mimeType, this.sourceUrl});

  Full.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['width'] = width;
    data['height'] = height;
    data['mime_type'] = mimeType;
    data['source_url'] = sourceUrl;
    return data;
  }
}

class ImageMeta {
  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<Null>? keywords;

  ImageMeta(
      {this.aperture,
      this.credit,
      this.camera,
      this.caption,
      this.createdTimestamp,
      this.copyright,
      this.focalLength,
      this.iso,
      this.shutterSpeed,
      this.title,
      this.orientation,
      this.keywords});

  ImageMeta.fromJson(Map<String, dynamic> json) {
    aperture = json['aperture'];
    credit = json['credit'];
    camera = json['camera'];
    caption = json['caption'];
    createdTimestamp = json['created_timestamp'];
    copyright = json['copyright'];
    focalLength = json['focal_length'];
    iso = json['iso'];
    shutterSpeed = json['shutter_speed'];
    title = json['title'];
    orientation = json['orientation'];
    // if (json['keywords'] != null) {
    //   keywords = <Null>[];
    //   json['keywords'].forEach((v) {
    //     keywords!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aperture'] = aperture;
    data['credit'] = credit;
    data['camera'] = camera;
    data['caption'] = caption;
    data['created_timestamp'] = createdTimestamp;
    data['copyright'] = copyright;
    data['focal_length'] = focalLength;
    data['iso'] = iso;
    data['shutter_speed'] = shutterSpeed;
    data['title'] = title;
    data['orientation'] = orientation;
    // if (this.keywords != null) {
    //   data['keywords'] = this.keywords!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
