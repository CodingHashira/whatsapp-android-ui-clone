import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/button_bar.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/content_gap.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/conversation_media_page.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/custom_tile.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/image_view.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class ConversationAboutPage extends StatefulWidget {
  const ConversationAboutPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.about,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final String about;

  @override
  State<ConversationAboutPage> createState() => _ConversationAboutPageState();
}

class _ConversationAboutPageState extends State<ConversationAboutPage> {
  var isVisible = true;

  var _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      if (_scrollPosition > 5) {
        isVisible = false;
      } else {
        isVisible = true;
      }
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            controller: _scrollController,
            children: [
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 27.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 8.0),
                      child: GestureDetector(
                        onTap: () => NavigationHelper.openPage(
                          context: context,
                          page: CustomImageView(
                            imagePath: widget.imageUrl,
                            titleWidget: Text(widget.title),
                            actionsList: const [],
                          ),
                        ),
                        child: Hero(
                          tag: 'profileImage',
                          child: Visibility(
                            visible: isVisible,
                            child: CircleAvatar(
                              radius: 55.0,
                              backgroundImage: AssetImage(widget.imageUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: CustomPopupMenuButton(
                        popButtonColor: Colors.white,
                        popButtonSize: 27.0,
                        popupMenuItems: data.aboutPopupMenuItemsList,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Center(
                child: Text(
                  '+91 9983664738',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const CustomButtonBar(),
              const ContentGap(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // data.textData['conversationAbout']![0],
                      widget.about,
                      style: kInfoTextStyle2.copyWith(
                        fontSize: 16.0,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'March 20, 2023',
                      style: kSubTitleTextStyle,
                    ),
                  ],
                ),
              ),
              const ContentGap(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PaddedSettingsTextInfo(
                          text: 'Media, links and docs'),
                      GestureDetector(
                        onTap: () => NavigationHelper.openPage(
                          context: context,
                          page: ConversationMediaPage(userName: widget.title),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              '20',
                              style: kSubTitleTextStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15.0,
                            ),
                            SizedBox(width: 5.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    margin: const EdgeInsets.only(left: 22.0, bottom: 10.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        var imagePath = 'images/media/m${index + 1}.jpg';
                        return GestureDetector(
                          onTap: () => NavigationHelper.openPage(
                            context: context,
                            page: CustomImageView(imagePath: imagePath),
                          ),
                          child: Container(
                            height: 70.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 5.0);
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 3.0),
              const ContentGap(),
              CustomListBuilder(
                leadingIndent: 3.0,
                leadingEndIndent: 20.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                itemCount: 3,
                list: data.aboutPageOptionList,
                startIndex: 0,
                returnWidgetType: CustomListTile,
              ),
              const ContentGap(),
              CustomListBuilder(
                leadingEndIndent: 22,
                itemCount: 2,
                list: data.aboutPageOptionList,
                startIndex: 3,
                returnWidgetType: CustomListTile,
              ),
              const ContentGap(),
              const PaddedSettingsTextInfo(text: '1 Group in common'),
              CustomListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    color: kAccentColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.people,
                    color: Colors.white,
                    // size: 22.0,
                  ),
                ),
                title: 'Create group with ${widget.title}',
              ),
              CustomListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('images/g1.jpg'),
                ),
                title: 'F.R.I.E.N.D.S',
                titleStyle: kTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                subTitle: 'Chandler, Joey, Monica, Phoebe, Rachael, Ros..',
              ),
              const ContentGap(),
              CustomTile(
                icon: FeatherIcons.slash,
                title: 'Block  ${widget.title}',
              ),
              CustomTile(
                icon: Icons.thumb_down_rounded,
                title: 'Report  ${widget.title}',
              ),
              const SizedBox(height: 5.0),
              const ContentGap(height: 15.0),
            ],
          ),
          Visibility(
            visible: !isVisible,
            child: Container(
              height: 95.0,
              color: kAppBarColor,
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomAppBar(
                isChildWidget: true,
                title: widget.title,
                imageUrl: 'images/p3.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
