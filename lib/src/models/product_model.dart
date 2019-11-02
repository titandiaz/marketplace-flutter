class Productos {
  List<Producto> items = new List();

  Productos();

  Productos.fromJsonList( List<dynamic> jsonList){
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
  int tienda;
  String nombre;
  int categoriaProducto;
  int subcategoria;
  int precio;
  String foto;
  int activo;
  String disponibilidad;
  String fotoCloudinary;
  String slug;
  String deletedAt;
  String idCloudinary;
  int envioGratis;
  int conVariante;
  String valorCompra;
  String createdAt;
  String updatedAt;

  Producto({
    this.id,
    this.tienda,
    this.nombre,
    this.categoriaProducto,
    this.subcategoria,
    this.precio,
    this.foto,
    this.activo,
    this.disponibilidad,
    this.fotoCloudinary,
    this.slug,
    this.deletedAt,
    this.idCloudinary,
    this.envioGratis,
    this.conVariante,
    this.valorCompra,
    this.createdAt,
    this.updatedAt,
  });

  Producto.fromJsonMap(Map<String, dynamic> json) {
    id                = json['id'];
    tienda            = json['tienda'];
    nombre            = json['nombre'];
    categoriaProducto = json['categoria_producto'];
    subcategoria      = json['subcategoria'];
    precio            = json['precio'];
    foto              = json['foto'];
    activo            = json['activo'];
    disponibilidad    = json['disponibilidad'];
    fotoCloudinary    = json['foto_cloudinary'];
    slug              = json['slug'];
    deletedAt         = json['deleted_at'];
    idCloudinary      = json['id_cloudinary'];
    envioGratis       = json['envio_gratis'];
    conVariante       = json['con_variante'];
    valorCompra       = json['valor_compra'];
    createdAt         = json['created_at'];
    updatedAt         = json['updated_at'];
  }

  getFotoCloudinary() {
    if (fotoCloudinary == null) {
      return 'http://www.alterenterprise.com/wp-content/uploads/2014/02/Image-not-available_1.jpg';
    } else {
      return fotoCloudinary.replaceFirst(new RegExp(r'upload'), 'upload/q_auto,c_scale,f_auto,w_300');
    }
  }
}
