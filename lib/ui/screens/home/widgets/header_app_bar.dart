part of '../home.dart';

class _HeaderAppBar extends StatelessWidget {
  const _HeaderAppBar({this.height, this.showTitle});

  static const double heightFraction = 0.66;

  final double height;
  final bool showTitle;

  Widget _buildCard() {
    return PokeContainer(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      children: <Widget>[
        SizedBox(height: 117),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            'What Pokemon\nare you looking for?',
            style: TextStyle(
              fontSize: 30,
              height: 0.9,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: 40),
        SearchBar(),
        SizedBox(height: 42),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.44,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
          ),
          padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
          itemCount: categories.length,
          itemBuilder: (context, index) => PokeCategoryCard(
            categories[index],
            onPress: () => AppNavigator.push(Routes.pokedex),
          ),
        )
      ],
    );
  }

  Widget _buildTitle(visible) {
    if (!visible) {
      return null;
    }

    return Text(
      'Pokedex',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: height,
      floating: true,
      pinned: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.red,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: _buildTitle(showTitle),
        background: _buildCard(),
      ),
    );
  }
}
