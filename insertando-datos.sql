INSERT INTO categorias (nombre, descripcion) VALUES
('Entretenimiento', 'Servicios de entretenimiento y diversión'),
('Gastronomía', 'Servicios de comida y bebida'),
('Logística', 'Servicios de organización y logística'),
('Decoración', 'Servicios de ambientación y decoración'),
('Audio y Video', 'Equipos de sonido, iluminación y proyección'),
('Mobiliario', 'Renta de muebles y equipo para eventos'),
('Seguridad', 'Servicios de seguridad y protección'),
('Transporte', 'Servicios de transporte y logística'),
('Entretenimiento Adultos', 'Shows y espectáculos para adultos');

INSERT INTO servicios (nombre, descripcion, precio_base, categoria_id) VALUES
('DJ y Sonido', 'Servicio de música y sonido profesional', 800.00, 1),
('Banquete para 50 personas', 'Servicio de catering básico', 2500.00, 2),
('Fotografía profesional', 'Sesión fotográfica de 4 horas', 1200.00, 1),
('Decoración floral', 'Ambientación con arreglos florales', 600.00, 4),
('Coordinador de evento', 'Supervisión y coordinación general', 400.00, 3),
('Animación infantil', 'Entretenimiento para niños', 300.00, 1),
('Iluminación profesional', 'Sistema de iluminación para escenario y ambiente', 700.00, 5),
('Renta de mobiliario (50 personas)', 'Mesas, sillas y mobiliario básico', 1200.00, 6),
('Servicio de seguridad (4 horas)', 'Vigilancia y control de acceso', 400.00, 7),
('Transporte ejecutivo', 'Servicio de transporte para 15 personas', 300.00, 8),
('Show de magia', 'Espectáculo de magia profesional (1 hora)', 500.00, 9),
('Barra libre básica', 'Servicio de bebidas por 4 horas', 1800.00, 2),
('Pantalla gigante y proyector', 'Equipo de proyección para presentaciones', 450.00, 5),
('Photobooth divertido', 'Cabina de fotos con accesorios', 600.00, 1),
('Coctelería de autor', 'Barra de cocteles especializados', 1500.00, 2),
('Sonido para ceremonias', 'Equipo de sonido para ceremonia civil o religiosa', 350.00, 5);

INSERT INTO proveedores (nombre, rubro, contacto, telefono, email, calificacion_promedio ) VALUES
('Sonido Perfecto SAC', 'DJ y Sonido', 'Juan Pérez', '999888777', 'sonido@perfecto.com',4.5),
('Catering Delicias', 'Gastronomía', 'María García', '999777666', 'catering@delicias.com', 4.5),
('FotoArt Studio', 'Fotografía', 'Carlos López', '999666555', 'info@fotoart.com', 4.4),
('Flores Bella', 'Decoración', 'Ana Martínez', '999555444', 'ventas@floresbella.com', 3),
('Iluminación Total SAC', 'Iluminación', 'Roberto Silva', '988776655', 'ventas@iluminaciontotal.com', 4.5),
('Muebles para Eventos', 'Mobiliario', 'Carmen Rojas', '977665544', 'alquiler@muebleseventos.com', 4.2),
('Seguridad Confiable', 'Seguridad', 'Luis Mendoza', '966554433', 'operaciones@seguridadconfiable.com', 4.8),
('Transporte Ejecutivo', 'Transporte', 'Jorge Díaz', '955443322', 'reservas@transporteexec.com', 4.3),
('Magia Creativa', 'Entretenimiento', 'Daniel Magician', '944332211', 'show@magiacreativa.com', 4.9),
('Barra Libre Perú', 'Bebidas', 'Sofía Torres', '933221100', 'pedidos@barralibrepe.com', 4.4),
('Proyecciones Pro', 'Audio y Video', 'Miguel Ángel', '922110099', 'tec@proyeccionespro.com', 4.6),
('FotoDiversión', 'Photobooth', 'Laura Jiménez', '911009988', 'alquiler@fotodiversion.com', 4.7),
('Coctelería Elite', 'Bebidas', 'Ricardo Bardelli', '900998877', 'eventos@cocteleriaelite.com', 4.8);

INSERT INTO estados_evento (nombre, descripcion, orden) VALUES
('PENDIENTE APROBACION', 'Esperando aprobación de la gestora', 1),
('APROBADO', 'Evento aprobado, en preparación', 2),
('RECHAZADO', 'Evento rechazado por la gestora', 3),
('EN PROCESO', 'Evento en ejecución', 4),
('COMPLETADO', 'Evento finalizado exitosamente', 5),
('CANCELADO', 'Evento cancelado', 6);

INSERT INTO tipos_evento (nombre, descripcion) VALUES
('Matrimonio', 'Ceremonia y recepción de boda'),
('Cumpleaños', 'Fiesta de celebración de cumpleaños'),
('Aniversario', 'Celebración de aniversario empresarial o personal'),
('Integración', 'Eventos de integración empresarial o grupal'),
('Graduación', 'Fiesta de celebración de graduación'),
('Corporativo', 'Eventos empresariales y corporativos');

INSERT INTO auth_users (email, password_hash, nombre, direccion, celular, rol, calificacion_promedio) VALUES
('gestora@eventosperu.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Laura Gestora','Av. Arequipa 123, Miraflores', '999111222', 'GESTORA', 5),
('cliente1@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ana María Suárez', 'Av. Arequipa 123, Miraflores', '911223344', 'CLIENTE', 4.5),
('cliente2@hotmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Carlos Rodríguez', 'Jr. Lima 456, San Isidro', '922334455', 'CLIENTE', 4.8),
('empresa@empresa.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tech Solutions SAC', 'Av. Javier Prado 789, San Borja', '933445566', 'CLIENTE', 5.0),
('familia@peru.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Familia González', 'Calle Los Olivos 321, Surco', '944556677', 'CLIENTE', 4.2);

INSERT INTO tipo_evento_servicios (tipo_evento_id, servicio_id, es_recomendado) VALUES
(1, 1, 1), 
(1, 2, 1), 
(1, 3, 1),  
(1, 4, 1),
(1, 7, 1),  
(1, 12, 1), 
(1, 14, 1),
(1, 15, 1),  
(2, 1, 1), 
(2, 6, 1),  
(2, 7, 1),  
(2, 11, 1), 
(2, 12, 1), 
(2, 14, 1), 
(3, 2, 1), 
(3, 5, 1), 
(3, 8, 1), 
(3, 12, 1), 
(3, 13, 1), 
(4, 1, 1), 
(4, 8, 1), 
(4, 10, 1), 
(4, 12, 1), 
(4, 13, 1), 
(5, 3, 1), 
(5, 7, 1), 
(5, 12, 1), 
(5, 14, 1), 
(6, 5, 1),  
(6, 9, 1),  
(6, 13, 1), 
(6, 16, 1);  

INSERT INTO eventos (cliente_id, tipo_evento_id, nombre_evento, fecha_evento, hora_evento, cantidad_invitados, ubicacion, estado_id) VALUES
(2, 1, 'Boda de Ana y Carlos', '2024-12-15', '16:00:00', 120, 'Hacienda San Isidro', 2),
(3, 6, 'Lanzamiento Producto X', '2024-11-20', '09:00:00', 80, 'Oficina Central Tech Solutions', 2),
(4, 2, 'Cumpleaños de Miguel - 30 años', '2024-10-25', '19:00:00', 50, 'Casa Familia González', 4),
(5, 3, '25 Aniversario Empresarial', '2024-11-30', '18:30:00', 100, 'Country Club Lima', 2),
(2, 5, 'Graduación Universidad - Laura', '2024-12-10', '17:00:00', 60, 'Jardines de Miraflores', 1);

INSERT INTO evento_servicios (evento_id, servicio_id, proveedor_id, precio_final, cantidad, observaciones, estado) VALUES
(1, 1, 1, 800.00, 1, 'Incluir música romántica y baile', 'COMPLETADO'),
(1, 2, 2, 2500.00, 1, 'Menú vegetariano para 15 personas', 'COMPLETADO'),
(1, 3, 3, 1200.00, 1, 'Sesión de 6 horas con álbum digital', 'COMPLETADO'),
(1, 4, 4, 600.00, 1, 'Decoración con rosas y lirios', 'COMPLETADO'),
(1, 12, 10, 1800.00, 1, 'Barra libre por 5 horas', 'COMPLETADO'),
(1, 14, 12, 600.00, 1, 'Photobooth con tema matrimonial', 'COMPLETADO'),
(2, 5, NULL, 400.00, 1, 'Coordinación general del evento', 'ASIGNADO'),
(2, 9, 7, 800.00, 2, '2 guardias para 6 horas', 'ASIGNADO'),
(2, 13, 11, 450.00, 1, 'Pantalla para presentación corporativa', 'ASIGNADO'),
(3, 1, 1, 800.00, 1, 'Música de los 90s y actual', 'EN_PROCESO'),
(3, 6, NULL, 300.00, 1, 'Animación para niños (5-10 años)', 'ASIGNADO'),
(3, 11, 9, 500.00, 1, 'Show de magia para adultos', 'EN_PROCESO'),
(3, 12, 10, 1800.00, 1, 'Barra libre básica por 4 horas', 'EN_PROCESO'),
(4, 2, 2, 2800.00, 1, 'Cena gourmet para 100 personas', 'ASIGNADO'),
(4, 5, NULL, 400.00, 1, 'Coordinación ejecutiva', 'ASIGNADO'),
(4, 8, 6, 1200.00, 1, 'Mobiliario para recepción', 'ASIGNADO'),
(4, 12, 13, 2000.00, 1, 'Barra de cocteles premium', 'ASIGNADO'),
(5, 3, 3, 1000.00, 1, 'Sesión de 3 horas con photoshoot grupal', 'PENDIENTE'),
(5, 14, 12, 600.00, 1, 'Photobooth con accesorios de graduación', 'PENDIENTE');

INSERT INTO cotizaciones (evento_id, subtotal, impuestos, total, estado, fecha_vencimiento) VALUES
(1, 7500.00, 1350.00, 8850.00, 'APROBADA', '2024-11-30'),
(2, 1650.00, 297.00, 1947.00, 'PENDIENTE', '2024-11-05'),
(3, 3400.00, 612.00, 4012.00, 'PAGADA', '2024-10-20'),
(4, 6400.00, 1152.00, 7552.00, 'APROBADA', '2024-11-15'),
(5, 1600.00, 288.00, 1888.00, 'PENDIENTE', '2024-11-25');

INSERT INTO calificaciones (evento_id, evaluador_id, tipo_evaluacion, proveedor_id, cliente_id, calificacion, comentario, evento_servicio_id) VALUES
(1, 2, 'CLIENTE_A_PROVEEDOR', 1, NULL, 5, 'Excelente DJ, mantuvo la energía toda la noche', 1),
(1, 2, 'CLIENTE_A_PROVEEDOR', 2, NULL, 4, 'Buena comida pero el servicio fue un poco lento', 2),
(1, 2, 'CLIENTE_A_PROVEEDOR', 3, NULL, 5, 'Fotos espectaculares, muy profesionales', 3),
(1, 2, 'CLIENTE_A_PROVEEDOR', 10, NULL, 5, 'Barra libre impecable, buen servicio', 5),
(3, 4, 'CLIENTE_A_PROVEEDOR', 1, NULL, 4, 'Buena música pero llegó 20 minutos tarde', 10),
(3, 4, 'CLIENTE_A_PROVEEDOR', 9, NULL, 5, 'Show de magia increíble, todos disfrutaron', 12),
(1, 1, 'GESTORA_A_PROVEEDOR', 4, NULL, 3, 'Decoración aceptable pero podría mejorar', 4),
(2, 1, 'GESTORA_A_PROVEEDOR', 7, NULL, 5, 'Servicio de seguridad muy profesional', 8),
(4, 1, 'GESTORA_A_PROVEEDOR', 13, NULL, 4, 'Buena coctelería pero precio elevado', 17),
(1, 1, 'GESTORA_A_CLIENTE', NULL, 2, 5, 'Cliente excelente, muy organizado', NULL),
(3, 1, 'GESTORA_A_CLIENTE', NULL, 4, 4, 'Buena comunicación, puntual en pagos', NULL),
(4, 1, 'GESTORA_A_CLIENTE', NULL, 5, 5, 'Empresa muy profesional, proceso fluido', NULL);

INSERT INTO seguimiento_eventos (evento_id, estado_anterior_id, estado_nuevo_id, usuario_id, comentario) VALUES
(1, 1, 2, 1, 'Cotización aprobada por el cliente'),
(1, 2, 4, 1, 'Inicio de coordinación con proveedores'),
(1, 4, 5, 1, 'Evento completado exitosamente'),
(2, 1, 2, 1, 'Evento aprobado por gerencia'),
(3, 1, 2, 1, 'Pago confirmado, evento aprobado'),
(3, 2, 4, 1, 'Proveedores asignados, en ejecución'),
(4, 1, 2, 1, 'Prepago realizado, evento confirmado'),
(5, 1, 1, 1, 'Esperando confirmación de disponibilidad');

INSERT INTO proveedor_disponibilidad (proveedor_id, fecha, disponible) VALUES
(1, '2024-12-15', 0),
(1, '2024-10-25', 0),
(1, '2024-12-20', 1),
(2, '2024-12-15', 0), 
(2, '2024-11-30', 0), 
(3, '2024-12-15', 0), 
(3, '2024-12-10', 0), 
(4, '2024-12-15', 0),
(7, '2024-11-20', 0), 
(9, '2024-10-25', 0), 
(10, '2024-12-15', 0), 
(10, '2024-10-25', 0), 
(12, '2024-12-15', 0), 
(12, '2024-12-10', 0), 
(13, '2024-11-30', 0); 


select * from auth_users;
select * from categorias;
select * from cotizaciones;
select * from estados_evento;
select * from evento_servicios;
select * from eventos;
select * from proveedor_disponibilidad;
select * from  proveedores;
select * from  seguimiento_eventos;
select * from servicios;
select * from tipo_evento_servicios;
select * from tipos_evento;

