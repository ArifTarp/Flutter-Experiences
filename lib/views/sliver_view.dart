import 'package:flutter/material.dart';

class SliverView extends StatelessWidget {
  const SliverView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            title: Text("AppBar Title"),
            centerTitle: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flexible Title"),
              centerTitle: true,
              background: Image.network(
                "https://i.picsum.photos/id/120/200/300.jpg?hmac=MG0pF8PmFWKEzuFPIWwUw15CadARgBh6cxPh_YuAALY",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            height: 100,
            color: Colors.black,
          )),
          SliverGrid.count(
            crossAxisCount: 4,
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data")
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
            height: 100,
            color: Colors.black,
          )),
           SliverGrid.extent(
            maxCrossAxisExtent: 120,
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data")
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: Card(child: Text("data")),
              color: Colors.red,
              height: 100,
            );
          }, childCount: 20))
        ],
      ),
    );
  }
}
