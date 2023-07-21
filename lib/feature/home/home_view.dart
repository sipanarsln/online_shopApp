import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/feature/home/sub_view/home_products_list_view.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/constants/string_constants.dart';
import 'package:online_shop/product/widget/text/sub_title.dart';
import 'package:online_shop/product/widget/text/title_text.dart';

part './sub_view/home_chips.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: context.paddingNormal,
          children: [
            _Header(),
            SizedBox(height: 25),
            _Search(),
            SizedBox(height: 25),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/image/special_offer.jpg'),
                ),
              ),
            ),
            const _TagListView(),
            // SizedBox(
            //   height: context.dynamicHeight(.6),
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     physics: const ClampingScrollPhysics(),
            //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 200,
            //       childAspectRatio: 3 / 3,
            //       crossAxisSpacing: 20,
            //       mainAxisSpacing: 20,
            //     ),
            //     itemCount: 10,
            //     itemBuilder: (BuildContext context, int index) {
            //       return const Placeholder();
            //     },
            //   ),
            // ),
            HomeListView()
          ],
        ),
      ),
    );
  }
}

class _TagListView extends StatelessWidget {
  const _TagListView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemExtent: 115,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return const _ActiveChip();
          }
          return const _PassiveChip();
        },
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorConstants.primaryColor,
      maxLength: 30,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: ColorConstants.grayLighter,
        prefixIcon: const Icon(Icons.search_outlined),
        suffixIcon: const Icon(Icons.format_list_bulleted_outlined),
        hintText: StringConstants.homeSearchHint,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: StringConstants.homeWelcomeBack,
              color: ColorConstants.primaryColor,
            ),
            SubTitle(
              text: 'Serhat Celik',
              color: ColorConstants.gray,
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_outlined,
            size: 40,
            color: ColorConstants.primaryColor,
          ),
        ),
      ],
    );
  }
}
