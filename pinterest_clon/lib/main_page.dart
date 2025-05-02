import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest_clon/detail_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:faker/faker.dart'; 
import 'messages_page.dart'; 
import 'details_count.dart'; 
import 'search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 1, 
      vsync: this,
    );
    super.initState();
  }

  void _onMessageIconTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MessagesPage()),
    );
  }

  void _onProfileIconTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsCount()), 
    );
  }

  void _showCustomModalSheet(String imageUrl) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _buildBottomSheetContent(imageUrl),
    );
  }

  void _onSearchIconTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

  Widget _buildBottomSheetContent(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Compartir en'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSocialIcon(
                      FontAwesomeIcons.share, 'Compartir', imageUrl),
                  SizedBox(width: 15),
                  _buildSocialIcon(
                      FontAwesomeIcons.facebook, 'Facebook', imageUrl),
                  SizedBox(width: 15),
                  _buildSocialIcon(
                      FontAwesomeIcons.instagram, 'Instagram', imageUrl),
                  SizedBox(width: 15),
                  _buildSocialIcon(
                      FontAwesomeIcons.whatsapp, 'WhatsApp', imageUrl),
                  SizedBox(width: 15),
                  _buildSocialIcon(
                      FontAwesomeIcons.twitter, 'Twitter', imageUrl),
                  SizedBox(width: 15),
                  _buildSocialIcon(FontAwesomeIcons.facebookMessenger,
                      'Messenger', imageUrl),
                ],
              ),
            ),
            Divider(
              thickness: 0.4,
            ),
            ListTile(
              title: Text('Ocultar Pin'),
              onTap: () {
                // Agrega la lógica para ocultar el pin
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Reportar Pin'),
              subtitle: Text(
                  'Infinge las Directrices para la comunidad de Pinterest'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 0.4,
            ),
            ListTile(
              title: Text('Este Pin está inspirado en tu actividad reciente'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label, String imageUrl) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () => Share.share('Check out this image: $imageUrl'),
        ),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TabBar(
                tabs: [
                  Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: const Text(
                      'All',
                    ),
                  ),
                ],
                labelPadding: const EdgeInsets.only(bottom: 5),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 25),
                indicatorWeight: 4,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        final imageUrl =
                            'https://picsum.photos/${800 + index}/${(index % 2 + 1) * 970}';
                        final username = faker.internet
                            .userName(); 
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      imageUrl: imageUrl,
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => AspectRatio(
                                    aspectRatio:
                                        (800 + index) / ((index % 2 + 1) * 970),
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(username),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      size: 20,
                                    ),
                                    onPressed: () =>
                                        _showCustomModalSheet(imageUrl),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(FontAwesomeIcons.house),
                  InkWell(
                    onTap: _onSearchIconTapped,
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.plus,
                    color: Theme.of(context).primaryColor,
                  ),
                  InkWell(
                    onTap: _onMessageIconTapped,
                    child: Icon(
                      CupertinoIcons.chat_bubble_fill,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  InkWell(
                    onTap: _onProfileIconTapped,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage: const CachedNetworkImageProvider(
                        'https://picsum.photos/100',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
