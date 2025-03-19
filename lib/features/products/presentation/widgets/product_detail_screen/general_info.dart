import 'package:flutter/material.dart';

class ProductGeneralInfo extends StatelessWidget {
  final String description;
  final double costPrice;
  final double appliedTaxes;
  final String unitOfMeasure;

  const ProductGeneralInfo({
    Key? key,
    required this.description,
    required this.costPrice,
    required this.appliedTaxes,
    required this.unitOfMeasure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Information',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Description: $description',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Cost Price: \$${costPrice.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Applied Taxes: ${appliedTaxes.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.separated(
                      scrollDirection:
                          Axis.horizontal, // Make the list horizontal
                      padding:
                          EdgeInsets.all(16), // Add padding around the list
                      itemCount: 10, // Number of buttons
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10), // Add a gap between buttons
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          onPressed: () {
                            print('Button ${index + 1} pressed');
                          },
                          child: Text('Button ${index + 1}'),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Unit of Measure: $unitOfMeasure',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
