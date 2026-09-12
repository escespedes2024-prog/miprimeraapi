CREATE TABLE movimientos_inventario (
    id INT NOT NULL AUTO_INCREMENT,
    producto_id INT NOT NULL,
    tipo_movimiento_id INT NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    referencia VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    FOREIGN KEY (producto_id)
        REFERENCES productos(id),

    FOREIGN KEY (tipo_movimiento_id)
        REFERENCES tipos_movimiento(id)
);