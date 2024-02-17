import 'package:deep_dive_get_cli/app/data/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Post extends StatelessWidget {
  final PostModel postModel;
  final void Function()? onPressed;
  const Post({
    super.key,
    required this.postModel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      36,
                    ),
                    child: SizedBox(
                      width: 36,
                      height: 36,
                      child: Image.asset(
                        postModel.fotoProfile.isEmpty
                            ? ""
                            : 'assets/images/${postModel.fotoProfile}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postModel.namaAkun.isEmpty ? "" : postModel.namaAkun,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      postModel.isSponsor
                          ? Text(
                              "Sponsored",
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          'assets/images/${postModel.postingGambar}.png',
          width: double.infinity,
          height: 390,
        ),
        const SizedBox(
          height: 9.25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    postModel.isLike ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
                const Icon(
                  CupertinoIcons.chat_bubble,
                ),
                const SizedBox(
                  width: 12,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 20,
                  child: Image.asset('assets/icons/instagram-share-icon.png'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.bookmark_outline_outlined,
                size: 26,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${postModel.jumlahLike} Likes',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '${postModel.namaAkun} ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: postModel.description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
