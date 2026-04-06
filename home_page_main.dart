/*
** Copyright (C) Ken Jin.
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
**/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum MenuSet { food, sport, sleep, medic, search, project }

class HomeMenu {
  const HomeMenu({
    required this.title,
    required this.description,
    this.uri = MenuSet.food,
  });

  final String title;
  final String description;
  final MenuSet uri;
}

const List<HomeMenu> _homeMenu = [
  HomeMenu(
    title: '饮食',
    description: '民以食为天, 这里汇集了和饮食相关的各种资讯.',
    uri: MenuSet.food,
  ),
  HomeMenu(
    title: '运动',
    description: '生命源于运动, 这里汇集了和运动相关的各种资讯.',
    uri: MenuSet.sport,
  ),
  HomeMenu(
    title: '睡眠',
    description: '人的一生有三分之一是在睡眠中度过的, 这里汇集了和睡眠相关的各种资讯.',
    uri: MenuSet.sleep,
  ),
  HomeMenu(
    title: '医药',
    description: '一草一木皆岐黄, 这里汇集了各种药物和医疗技术相关的资讯.',
    uri: MenuSet.medic,
  ),
  HomeMenu(
    title: '搜索',
    description: '在全部资讯中予以搜索, 并且可以在结果中作再次搜索.',
    uri: MenuSet.search,
  ),
  HomeMenu(title: '最新版本', description: '讲述本项目以及版权相关的事宜.', uri: MenuSet.project),
];

class SectionText extends StatelessWidget {
  const SectionText({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );
    final descriptionStyle = theme.textTheme.bodyMedium;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(title, style: titleStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(description, style: descriptionStyle),
        ),
      ],
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem({super.key, required this.menuItem});

  final HomeMenu menuItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: SectionText(
            title: menuItem.title,
            description: menuItem.description,
          ),
        ),
      ),
    );
  }
}

class HomeMenuContent extends StatelessWidget {
  const HomeMenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 300,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      shrinkWrap: true,
      children: [for (final mItem in _homeMenu) HomeMenuItem(menuItem: mItem)],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HLife Home UI demo',
      home: Scaffold(body: Center(child: HomeMenuContent())),
    );
  }
}
