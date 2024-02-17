import 'package:deep_dive_get_cli/app/shared/widgets/image_story.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/post_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/story_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset('assets/images/IG logo.png'),
                const Icon(Icons.keyboard_arrow_down_outlined),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Image.asset('assets/images/messenger.png'),
              const SizedBox(
                width: 24,
              ),
              Image.asset('assets/images/addstory.png'),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 28,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/reel.png'),
                  color: Colors.black,
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/shop.png'),
                  color: Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('assets/images/foto_profile.png'),
                  ),
                ),
                label: '',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 97.75,
                  child: ListView.builder(
                    itemCount: controller.storyModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      StoryModel data = controller.storyModel[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                        ),
                        child: ImageStory(
                          story: data,
                          onTap: () {
                            controller.toStoryPageView(data.storyItems);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Post(
                  postModel: controller.postModel,
                  onPressed: controller.changeIconLike,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
