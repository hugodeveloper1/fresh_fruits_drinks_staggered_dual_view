import 'package:flutter/material.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/controllers/home_controller.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/views/fruit_details.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/widgets/fruit_card.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/widgets/staggered_dual_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = context.read<HomeController>();
    homeController.getFruits();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text('Smoothies'.toUpperCase()),
            actions: [
              IconButton(
                onPressed: () {},
                splashRadius: 18,
                icon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Color(0xFF6C6C6C),
                ),
              ),
            ],
          ),
          Expanded(
            child: controller.isLoading
                ? StaggeredDualView(
                    fruits: controller.fruits,
                    spacing: size.width * 0.07,
                    itemBuilder: (fruit) {
                      return FruitCard(
                        fruit: fruit,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return FruitDetails(
                                fruit: fruit,
                              );
                            },
                          ));
                        },
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
