import 'package:go_router/go_router.dart';
import 'package:retailpi/features/category/presentation/pages/category_page.dart';
import 'package:retailpi/features/product_tags/presentation/pages/products_tags_page.dart';
import 'package:retailpi/features/products/presentation/pages/product_add.dart';
import 'package:retailpi/features/products/presentation/pages/product_details_page.dart';
import 'package:retailpi/features/products/presentation/pages/product_edit_page.dart';
import 'package:retailpi/features/products/presentation/pages/product_shell.dart';
import 'package:retailpi/features/products/presentation/pages/products_page.dart';

final productRoutes = ShellRoute(
    builder: (context, state, child) => ProductShell(child: child),
    routes: [
      GoRoute(
        path: '/products',
        builder: (context, state) => ProductsPage(),
        routes: [
          GoRoute(
            path: 'add',
            builder: (context, state) => ProductAddPage(),
          ),
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              // Redirect if ID is not a number
              if (int.tryParse(id) == null) {
                return ProductsPage();
              }
              return ProductDetailsPage(productId: id);
            },
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ProductEditPage(productId: id);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => CategoryPage(),
        routes: [
          GoRoute(
            path: 'add',
            builder: (context, state) => ProductAddPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/tags',
        builder: (context, state) => ProductTagsPage(),
      ),
    ]);
