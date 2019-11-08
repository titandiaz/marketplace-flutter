
class Productos {
  List<Producto> items = new List();

  Productos();

  Productos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final producto = new Producto.fromJsonMap(item);
      items.add(producto);
      print(producto);
    }
  }
}

class Producto {
  int id;
  String nombre;
  int precio;
  String foto;
  String fotoCloudinary;
  Tienda tienda;
  List<Variante> variantes;
  List<FotosProducto> fotosProducto;
  dynamic categoriaProducto;
  List<ProductoInfo> productoInfo;

  Producto({
    this.id,
    this.nombre,
    this.precio,
    this.foto,
    this.fotoCloudinary,
    this.tienda,
    this.variantes,
    this.fotosProducto,
    this.categoriaProducto,
    this.productoInfo,
  });

  Producto.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    precio = json['precio'];
    foto = json['foto'];
    fotoCloudinary = json['foto_cloudinary'];
    tienda = new Tienda.fromJsonMap(json['tienda']);
    variantes = json['variantes'].cast<Variante>();
    fotosProducto = json['fotos_producto'].cast<FotosProducto>();
    categoriaProducto = json['categoria_producto'];
    productoInfo = json['producto_info'].cast<ProductoInfo>();
  }
  getFotoCloudinary() {
    if (fotoCloudinary == null) {
      return 'http://www.alterenterprise.com/wp-content/uploads/2014/02/Image-not-available_1.jpg';
    } else {
      return fotoCloudinary.replaceFirst(
          new RegExp(r'upload'), 'upload/q_auto,c_scale,f_auto,w_300');
    }
  }
}

class FotosProducto {
  int id;
  int idProducto;
  String foto;
  String idCloudinary;
  String fotoCloudinary;

  FotosProducto({
    this.id,
    this.idProducto,
    this.foto,
    this.idCloudinary,
    this.fotoCloudinary,
  });
}

class ProductoInfo {
  int id;
  String marca;
  String descripcion;
  String sku;
  int inventario;

  ProductoInfo({
    this.id,
    this.marca,
    this.descripcion,
    this.sku,
    this.inventario,
  });
}

class Tienda {
  int id;
  String nombre;
  String logo;
  String ciudades;
  String categorias;

  Tienda({
    this.id,
    this.nombre,
    this.logo,
    this.ciudades,
    this.categorias,
  });
  Tienda.fromJsonMap(Map<String, dynamic> json){
    id = json['id'];
    nombre = json['nombre'];
    logo = json['logo'];
    ciudades = json['ciudades'];
    categorias = json['categorias'];
  }
}

class Variante {
  int id;
  String variantes;
  int idProducto;
  List<Combinacione> combinaciones;

  Variante({
    this.id,
    this.variantes,
    this.idProducto,
    this.combinaciones,
  });
}

class Combinacione {
  int id;
  String combinaciones;
  int idProductosVariantes;

  Combinacione({
    this.id,
    this.combinaciones,
    this.idProductosVariantes,
  });
}
