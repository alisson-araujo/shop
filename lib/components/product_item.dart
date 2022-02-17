import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              // color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.productForm,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir item'),
                    content: const Text('Deseja excluir o produto?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Provider.of<ProductList>(
                              context,
                              listen: false,
                            ).removeProduct(product);
                            Navigator.of(ctx).pop();
                          },
                          child: const Text('SIM')),
                      TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text('NÃO')),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
