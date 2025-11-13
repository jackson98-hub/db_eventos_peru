DROP DATABASE IF EXISTS db_eventos_peru;
CREATE DATABASE db_eventos_peru;
USE db_eventos_peru;
CREATE TABLE auth_users (
  id VARCHAR(20) PRIMARY KEY,
  email VARCHAR(150) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  enabled TINYINT(1) NOT NULL DEFAULT 1,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(200),
  celular VARCHAR(20),
  rol VARCHAR(50) DEFAULT 'CLIENTE',
  calificacion_promedio DECIMAL(3,2) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tipos de evento
CREATE TABLE tipos_evento (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  activo TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- Categorías
CREATE TABLE categorias (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1,
  user_id varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- Estados de evento
CREATE TABLE estados_evento (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT,
  orden INT DEFAULT 0,
  status TINYINT(1) DEFAULT 1
);
-- Servicios
CREATE TABLE servicios (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion TEXT,
  precio_base DECIMAL(10,2) NOT NULL,
  categoria_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  disponible TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Relación tipo_evento → servicios
CREATE TABLE tipo_evento_servicios (
  id VARCHAR(20) PRIMARY KEY,
  tipo_evento_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  servicio_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  es_recomendado TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (tipo_evento_id) REFERENCES tipos_evento(id) ON DELETE CASCADE,
  FOREIGN KEY (servicio_id) REFERENCES servicios(id) ON DELETE CASCADE,
  UNIQUE KEY uk_tipo_servicio (tipo_evento_id, servicio_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Proveedores
CREATE TABLE proveedores (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  rubro VARCHAR(100),
  contacto VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(150),
  calificacion_promedio DECIMAL(3,2) DEFAULT 0,
  estado VARCHAR(50) DEFAULT 'DISPONIBLE',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Eventos
CREATE TABLE eventos (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  cliente_id VARCHAR(20) NOT NULL,
  tipo_evento_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  nombre_evento VARCHAR(150),
  fecha_evento DATE NOT NULL,
  hora_evento TIME NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES auth_users(id),
  FOREIGN KEY (tipo_evento_id) REFERENCES tipos_evento(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Evento → servicios
CREATE TABLE evento_servicios (
  id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY,
  evento_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  servicio_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  proveedor_id VARCHAR(20)  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  precio_final DECIMAL(10,2) NOT NULL,
  cantidad INT DEFAULT 1,
  observaciones TEXT,
  estado VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
  FOREIGN KEY (servicio_id) REFERENCES servicios(id),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





-- Cotizaciones
CREATE TABLE cotizaciones (
  id VARCHAR(20) PRIMARY KEY,
  evento_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  impuestos DECIMAL(10,2) DEFAULT 0,
  total DECIMAL(10,2) NOT NULL,
  estado VARCHAR(50) DEFAULT 'PENDIENTE',
  fecha_generada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_vencimiento DATE,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE
);

-- Calificaciones
CREATE TABLE calificaciones (
  id VARCHAR(20) PRIMARY KEY,
  evento_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
evento_servicio_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
proveedor_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
cliente_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
evaluador_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  tipo_evaluacion VARCHAR(50) NOT NULL,
  calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
  comentario TEXT,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (evento_id) REFERENCES eventos(id),
  FOREIGN KEY (evento_servicio_id) REFERENCES evento_servicios(id),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  FOREIGN KEY (cliente_id) REFERENCES auth_users(id),
  FOREIGN KEY (evaluador_id) REFERENCES auth_users(id)
);


-- Seguimiento eventos
CREATE TABLE seguimiento_eventos (
  id VARCHAR(20) PRIMARY KEY,
  evento_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
estado_anterior_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
estado_nuevo_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
usuario_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  comentario TEXT,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
  FOREIGN KEY (estado_anterior_id) REFERENCES estados_evento(id),
  FOREIGN KEY (estado_nuevo_id) REFERENCES estados_evento(id),
  FOREIGN KEY (usuario_id) REFERENCES auth_users(id)
);

-- Disponibilidad de proveedores
CREATE TABLE proveedor_disponibilidad (
  id VARCHAR(20) PRIMARY KEY,
 proveedor_id VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  fecha DATE NOT NULL,
  disponible TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) DEFAULT 1,
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id) ON DELETE CASCADE,
  UNIQUE KEY uk_proveedor_fecha (proveedor_id, fecha)
);
