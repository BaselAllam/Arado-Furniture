

import 'package:arado/models/product/productcontroller.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:arado/models/categories/categorycontroller.dart';

class MainModel extends Model with ProductController, CategoryController{}