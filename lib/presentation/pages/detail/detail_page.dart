import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/config/app_text_styles.dart';
import 'package:news_app/domain/entities/article.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Text(
                article.title ?? "",
                style: AppTextStyles.title,
                maxLines: null,
              ),
              const SizedBox(
                height: 10,
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  memCacheHeight: 150,
                  memCacheWidth: 150,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                  ),
                  imageUrl: article.urlToImage ??
                      "https://s.yimg.com/ny/api/res/1.2/KU.o.AeYu2FBLHc.D4bY8w--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://s.yimg.com/os/creatr-uploaded-images/2024-05/4dcc3510-1c98-11ef-9772-9453ed1243aa",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.content ?? "",
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
