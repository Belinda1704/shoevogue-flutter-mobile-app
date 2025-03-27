import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../cart/views/cart_view.dart';
import '../../favorites/views/favorites_view.dart';
import '../../profile/views/profile_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'ShoeVogue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Find your perfect pair',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('All Products'),
              onTap: () {
                controller.changeCategory('All');
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              _buildMainHome(context, scaffoldKey),
              const FavoritesView(),
              const CartView(),
              const ProfileView(),
            ],
          )),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changePage,
          backgroundColor: Theme.of(context).cardColor,
          elevation: 0,
          height: 65,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined,
                  color: controller.currentIndex.value == 0
                      ? Colors.blue
                      : Colors.grey),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline,
                  color: controller.currentIndex.value == 1
                      ? Colors.blue
                      : Colors.grey),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: controller.currentIndex.value == 2
                      ? Colors.blue
                      : Colors.grey),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline,
                  color: controller.currentIndex.value == 3
                      ? Colors.blue
                      : Colors.grey),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainHome(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 180,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[700]!,
                  Colors.blue[500]!,
                ],
              ),
            ),
            child: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'ShoeVogue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                            onPressed: () {
                              // TODO: Implement notifications
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search in Store',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryCard(context, 'All', Icons.all_inclusive),
                      _buildCategoryCard(context, 'Sneakers', Icons.directions_run),
                      _buildCategoryCard(context, 'Formal', Icons.business_center),
                      _buildCategoryCard(context, 'Sports', Icons.sports_soccer),
                      _buildCategoryCard(context, 'Casual', Icons.weekend),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Show all products
                      },
                      child: const Text('View all'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: Obx(() {
            print('Rebuilding product grid with ${controller.filteredProducts.length} products');
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildProductCard(context, index),
                childCount: controller.filteredProducts.length,
              ),
            );
          }),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return Obx(() => GestureDetector(
      onTap: () => controller.changeCategory(title),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 90,
        decoration: BoxDecoration(
          color: controller.selectedCategory.value == title
              ? Colors.blue
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: controller.selectedCategory.value == title
                  ? Colors.white
                  : Colors.grey.shade700,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: controller.selectedCategory.value == title
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildProductCard(BuildContext context, int index) {
    final product = controller.filteredProducts[index];
    return GestureDetector(
      onTap: () {
        Get.toNamed('/product-detail', arguments: product);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Image.asset(
                      product['imageUrl'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: ${product['imageUrl']}');
                        return Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: InkWell(
                      onTap: () {
                        controller.toggleFavorite(product['id']);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(200),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          product['isFavorite'] ?? false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Product details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
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