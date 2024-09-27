import 'package:flutter/material.dart';
import 'package:shoapp/common/widgets/loader.dart';
import 'package:shoapp/constants/global_variables.dart';
import 'package:shoapp/constants/utils.dart';
import 'package:shoapp/features/home/services/home_services.dart';
import 'package:shoapp/models/product.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = "/category-deals";
  final String category;

  const CategoryDealsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  final HomeServices homeServices = HomeServices();
  List<Product>? productList;

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  Future<void> fetchCategoryProducts() async {
    try {
      productList = await homeServices.fetchCategoryProducts(
        context: context,
        category: widget.category,
      );
      setState(() {});
    } catch (e) {
      showSnackBar(context, "Error fetching products: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: productList == null
          ? const Loader()  // Loader shown while products are being fetched
          : productList!.isEmpty
              ? _buildNoProductsFound()  // Fallback if no products are found
              : _buildProductGrid(),  // Grid of products when data is available
    );
  }

  // AppBar with gradient and category title
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: Text(
          widget.category,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Fallback widget for no products found
  Widget _buildNoProductsFound() {
    return Center(
      child: Text(
        'No products found for ${widget.category}',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  // Grid view builder for products
  Widget _buildProductGrid() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'Keep shining for ${widget.category}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 170,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10),
            itemCount: productList!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.4,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final product = productList![index];
              return _buildProductItem(product);
            },
          ),
        ),
      ],
    );
  }

  // Widget to build each product item
  Widget _buildProductItem(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 130,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                product.images[0],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
