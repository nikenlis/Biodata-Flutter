import 'dart:ui' as ui;
import 'package:biodata/theme.dart';
import 'package:biodata/widgets/bullet_list.dart';
import 'package:biodata/widgets/project_item.dart';
import 'package:biodata/widgets/skill_list_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildProfile(context),
          buildBiodata(context),
          buildSkill(context),
          buildTab(context),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Stack(children: [
      ClipPath(
        clipper: NativeClipper(),
        child: Container(
          height: 150,
          color: purpleColor,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 150 - 75,
          left: MediaQuery.of(context).size.width / 2 - 75,
        ),
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/profile-img.jpeg')),
        ),
      )
    ]);
  }

  Widget buildBiodata(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            'Niken Lismiati',
            style: blackTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'A Mobile Enthusiast!',
            style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(
                          Uri.parse('https://github.com/nikenlis'))) {
                        launchUrl(Uri.parse('https://github.com/nikenlis'));
                      }
                    },
                    splashColor: Colors.white,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(
                          Uri.parse('https://www.instagram.com/nikenlish/'))) {
                        launchUrl(
                            Uri.parse('https://www.instagram.com/nikenlish/'));
                      }
                    },
                    splashColor: Colors.white,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(Uri.parse(
                          'https://www.linkedin.com/in/niken-lismiati-b33974234/'))) {
                        launchUrl(Uri.parse(
                            'https://www.linkedin.com/in/niken-lismiati-b33974234/'));
                      }
                    },
                    splashColor: Colors.white,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSkill(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Center(
            child: Text(
              'My Skills',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 14),

          //ini hard skill
          SkillListItem(
            skills: [
              MySkillListItem(
                  iconUrl: 'assets/flutter-logo.png',
                  title: 'Flutter',
                  color: purpleColor),
              MySkillListItem(
                iconUrl: 'assets/dart-logo.png',
                title: 'Dart',
                color: blackColor,
              ),
              MySkillListItem(
                  iconUrl: 'assets/mysql-logo.png',
                  title: 'Mysql',
                  color: greenColor),
              MySkillListItem(
                  iconUrl: 'assets/figma-logo.png',
                  title: 'Figma',
                  color: redColor),
            ],
            showIcon: true,
          ),

          //ini soft kill
          const SizedBox(height: 14),
          SkillListItem(
            skills: [
              MySkillListItem(title: 'Comunication', color: purpleColor),
              MySkillListItem(
                title: 'Problem Solving',
                color: blackColor,
              ),
              MySkillListItem(title: 'Teamwork', color: greenColor),
              MySkillListItem(title: 'Collaboration', color: blueColor),
            ],
            showIcon: false,
            viewportFraction: 0.3,
          ),
        ],
      ),
    );
  }

  Widget buildTab(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: purpleColor,
            tabs: const [
              Tab(
                child: Text("About"),
              ),
              Tab(
                child: Text("Project"),
              )
            ],
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 50),
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: ListView(
                    children: [
                      Text(
                        'About Me',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        'Hello, My name is Niken.\n'
                        'I am a student at Amikom Yogyakarta University, \n'
                        'I am a person who is passionate about coding, '
                        'I like to learn new things'
                        ' and able to adapt quickly.\n',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Experiance',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BulletItem(
                          mainText:
                              'Programming Algorithm Laboratory Assistant',
                          secondText: 'Sept - Jan 2023'),
                      const BulletItem(
                          mainText: 'Data Structure Laboratory Assistant ',
                          secondText: 'Feb 2024 - Present'),
                      const BulletItem(
                          mainText: 'Public Relation - Forum Asisten',
                          secondText: 'Oct 2023 - Present'),
                      const BulletItem(
                          mainText:
                              '1st Place in Internet of Things at \nGelar Karya Mahasiswa held by the the Informatics \nProgram of Universitas Amikom Yogyakarta ',
                          secondText: 'Feb 2023'),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 50),
                  child: ListView(
                    children: [
                      Center(
                        child: Wrap(
                          spacing: 17,
                          runSpacing: 18,
                          children: [
                            ProjectItem(
                                imageUrl: 'assets/e-parking.jpeg',
                                title: 'E-parking',
                                url: Uri.parse('https://flutter.dev')),
                            ProjectItem(
                                imageUrl: 'assets/slicing-emoney.png',
                                title: 'Slicing e-money',
                                url: Uri.parse(
                                    'https://github.com/nikenlis/BANK_SHA')),
                            ProjectItem(
                                imageUrl: 'assets/dashboard-admin.png',
                                title: 'Dashboard Admin',
                                url: Uri.parse(
                                    'https://github.com/nikenlis/dashboard_admin_resep')),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(ui.Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
