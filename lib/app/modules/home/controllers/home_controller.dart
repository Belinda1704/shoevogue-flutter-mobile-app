import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
  final RxString selectedCategory = 'All'.obs;
  final RxList<Map<String, dynamic>> filteredProducts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('HomeController initializing...');
    loadProducts();
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  void changeCategory(String category) {
    print('Changing category to: $category');
    selectedCategory.value = category;
    filterProducts();
  }

  void filterProducts() {
    if (selectedCategory.value == 'All') {
      filteredProducts.value = products;
    } else {
      filteredProducts.value = products
          .where((product) => product['category'] == selectedCategory.value)
          .toList();
    }
    print('Filtered products: ${filteredProducts.length}');
  }

  void toggleFavorite(String id) {
    final index = products.indexWhere((product) => product['id'] == id);
    if (index != -1) {
      products[index]['isFavorite'] = !(products[index]['isFavorite'] ?? false);
      products.refresh(); // Force refresh of list
      filterProducts(); // Re-filter to update filtered list
    }
  }

  void addToCart(String productId) {
    // Implementation for cart functionality
    Get.snackbar(
      'Added to Cart',
      'Product added to your cart successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void loadProducts() {
    print('Loading products...');
    products.value = [
      // Sneakers Category
      {
        'id': '1',
        'name': 'Nike Air Jordan Orange',
        'price': 199.99,
        'imageUrl': TImages.productImage5,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '2',
        'name': 'Nike Air Jordan Blue',
        'price': 189.99,
        'imageUrl': TImages.productImage10,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '3',
        'name': 'Nike Air Jordan Black Red',
        'price': 209.99,
        'imageUrl': TImages.productImage4,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '4',
        'name': 'Nike Air Jordan White Red',
        'price': 199.99,
        'imageUrl': TImages.productImage7,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '5',
        'name': 'Nike Air Jordan White Magenta',
        'price': 189.99,
        'imageUrl': TImages.productImage6,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '6',
        'name': 'Nike Air Jordan Single Orange',
        'price': 179.99,
        'imageUrl': TImages.productImage11,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '7',
        'name': 'Nike Air Max',
        'price': 159.99,
        'imageUrl': TImages.productImage12,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '8',
        'name': 'Yeezy',
        'price': 299.99,
        'imageUrl': TImages.productImage27,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '9',
        'name': 'Adidas Casual',
        'price': 129.99,
        'imageUrl': TImages.productImage28,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '10',
        'name': 'Adidas',
        'price': 139.99,
        'imageUrl': TImages.productImage29,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '11',
        'name': 'Airforce 2',
        'price': 149.99,
        'imageUrl': TImages.productImage30,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '12',
        'name': 'Airforce 1',
        'price': 159.99,
        'imageUrl': TImages.productImage31,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '13',
        'name': 'Jordan 5',
        'price': 219.99,
        'imageUrl': TImages.productImage34,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '14',
        'name': 'New Balance 4',
        'price': 109.99,
        'imageUrl': TImages.productImage38,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '15',
        'name': 'New Balance 5',
        'price': 119.99,
        'imageUrl': TImages.productImage39,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '16',
        'name': 'New Balance 6',
        'price': 129.99,
        'imageUrl': TImages.productImage40,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '17',
        'name': 'Nike Defy',
        'price': 149.99,
        'imageUrl': TImages.productImage41,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '18',
        'name': 'Nike Pull Up',
        'price': 139.99,
        'imageUrl': TImages.productImage42,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '19',
        'name': 'Plaid Nikes',
        'price': 169.99,
        'imageUrl': TImages.productImage21,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '20',
        'name': 'Women\'s Air Jordan',
        'price': 189.99,
        'imageUrl': TImages.productImage24,
        'category': 'Sneakers',
        'isFavorite': false,
      },
      {
        'id': '21',
        'name': 'Nike Shoes Classic',
        'price': 159.99,
        'imageUrl': TImages.productImage1,
        'category': 'Sneakers',
        'isFavorite': false,
      },

      // Formal Category
      {
        'id': '22',
        'name': 'Prada Leather',
        'price': 399.99,
        'imageUrl': TImages.productImage22,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '23',
        'name': 'Leather Shoes',
        'price': 249.99,
        'imageUrl': TImages.productImage36,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '24',
        'name': 'Loafer',
        'price': 179.99,
        'imageUrl': TImages.productImage37,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '25',
        'name': 'Men Formal',
        'price': 189.99,
        'imageUrl': TImages.productImage49,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '26',
        'name': 'Lace Leather Men Shoe',
        'price': 229.99,
        'imageUrl': TImages.productImage35,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '27',
        'name': 'The D\'Orsay',
        'price': 259.99,
        'imageUrl': TImages.productImage43,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '28',
        'name': 'Stiletto',
        'price': 239.99,
        'imageUrl': TImages.productImage48,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '29',
        'name': 'Zara Heels',
        'price': 199.99,
        'imageUrl': TImages.productImage47,
        'category': 'Formal',
        'isFavorite': false,
      },
      {
        'id': '30',
        'name': 'Hot Talon',
        'price': 189.99,
        'imageUrl': TImages.productImage20,
        'category': 'Formal',
        'isFavorite': false,
      },

      // Sports Category
      {
        'id': '31',
        'name': 'Nike Basketball Shoe',
        'price': 169.99,
        'imageUrl': TImages.productImage13,
        'category': 'Sports',
        'isFavorite': false,
      },
      {
        'id': '32',
        'name': 'Nike Wildhorse',
        'price': 159.99,
        'imageUrl': TImages.productImage14,
        'category': 'Sports',
        'isFavorite': false,
      },
      {
        'id': '33',
        'name': 'Sportwear',
        'price': 149.99,
        'imageUrl': TImages.productImage46,
        'category': 'Sports',
        'isFavorite': false,
      },
      {
        'id': '34',
        'name': 'Women\'s Athletic',
        'price': 139.99,
        'imageUrl': TImages.productImage25,
        'category': 'Sports',
        'isFavorite': false,
      },
      {
        'id': '35',
        'name': 'Chaussures',
        'price': 149.99,
        'imageUrl': TImages.productImage19,
        'category': 'Sports',
        'isFavorite': false,
      },

      // Casual Category
      {
        'id': '36',
        'name': 'Casual Vans',
        'price': 89.99,
        'imageUrl': TImages.productImage32,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '37',
        'name': 'Women Vans',
        'price': 84.99,
        'imageUrl': TImages.productImage33,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '38',
        'name': 'Vans Old Skool',
        'price': 79.99,
        'imageUrl': TImages.productImage44,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '39',
        'name': 'White Vans',
        'price': 74.99,
        'imageUrl': TImages.productImage45,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '40',
        'name': 'Adidas Samba',
        'price': 99.99,
        'imageUrl': TImages.productImage23,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '41',
        'name': 'Women\'s Sandals',
        'price': 69.99,
        'imageUrl': TImages.productImage26,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '42',
        'name': 'Slipper Product 1',
        'price': 49.99,
        'imageUrl': TImages.productImage15,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '43',
        'name': 'Slipper Product 2',
        'price': 44.99,
        'imageUrl': TImages.productImage16,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '44',
        'name': 'Slipper Product 3',
        'price': 39.99,
        'imageUrl': TImages.productImage17,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '45',
        'name': 'Slipper Product',
        'price': 34.99,
        'imageUrl': TImages.productImage18,
        'category': 'Casual',
        'isFavorite': false,
      },
      {
        'id': '46',
        'name': 'Product Slippers',
        'price': 29.99,
        'imageUrl': TImages.productImage3,
        'category': 'Casual',
        'isFavorite': false,
      },
    ];
    
    print('Loaded ${products.length} products');
    // Initialize filtered products with all products
    filterProducts();
  }
} 