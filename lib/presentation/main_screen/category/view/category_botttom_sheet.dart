import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/context_extension.dart';
import '../../../../repositories/category_repository.dart';
import '../../sidebar/sidebar.dart';
import '../bloc/category_bloc.dart';
import 'widgets/color_picker.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(
        categoryRepository: context.read<CategoryRepository>(),
      ),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * .48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New category',
                style: context.typo.createUpdateCategoryLabelStyle(),
              ),
              const SizedBox(
                height: 5.0,
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return TextFormField(
                    cursorColor: Colors.white70,
                    style: context.typo.categoryNameTextStyle(),
                    decoration: InputDecoration(
                      hintText: 'Category Name',
                      hintStyle: context.typo.categoryNameHintStyle(),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                    ),
                    onChanged: (value) {
                      context
                          .read<CategoryBloc>()
                          .add(CategoryNameChanged(categoryName: value));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Expanded(
                child: ColorPicker(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                          child: Text(
                            'Cancel'.toUpperCase(),
                            style: context.typo.popUpButtonStyle(),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.white24,
                          thickness: 1.5,
                        ),
                        TextButton(
                          onPressed: () async {
                            context
                                .read<CategoryBloc>()
                                .add(CreateCategorySaved());
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Save'.toUpperCase(),
                            style: context.typo.popUpButtonStyle(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
