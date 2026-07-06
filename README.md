# 🦷 DentalSistem

Presentando **DentalSistem**: una plataforma integral enfocada en la automatización y gestión operativa de clínicas odontológicas. Diseñada para reemplazar los procesos manuales y agendas físicas, esta herramienta centraliza la información crítica del consultorio en un entorno seguro, rápido y altamente disponible.

Este sistema garantiza que la información de salud, los horarios de atención y el control interno se manejen con los más altos estándares de privacidad y eficiencia, agilizando el flujo de trabajo entre la recepción y el área médica.

---

## 🏗️ Arquitectura y Desarrollo

El proyecto fue concebido como una aplicación monolítica estructurada bajo el patrón **Modelo-Vista-Controlador (MVC)**, aplicando buenas prácticas de desarrollo, persistencia de datos relacionales y un entorno de infraestructura portable.

* **Núcleo del Sistema (Backend):** Desarrollado con **PHP 8** y el framework **Laravel**. Se encarga de procesar la lógica de negocio, protegiendo las rutas mediante *Middleware*, encriptación de contraseñas nativa con Bcrypt y prevención activa contra ataques CSRF e inyecciones SQL.
* **Persistencia y Modelado de Datos:** La base de datos opera sobre **MySQL**, utilizando migraciones y *seeders* para construir un esquema relacional robusto. Garantiza la integridad referencial entre el catálogo de pacientes, la agenda de citas, y las tablas de acceso interno como la de los **empleados** registrados en el sistema.
* **Interfaz de Usuario (Frontend):** Las vistas fueron construidas mediante el motor de plantillas **Blade** y estilizadas de principio a fin con **Tailwind CSS**. Esto permite una navegación fluida, completamente *responsive* y sin tiempos de recarga innecesarios gracias a la optimización de los componentes.
* **Infraestructura y Portabilidad:** Todo el ecosistema de la aplicación se encuentra completamente **dockerizado**. Esto asegura la idempotencia del entorno, permitiendo levantar toda la infraestructura con un solo comando sin depender de configuraciones locales del servidor.

---

## 🌟 Módulos Destacados

* **Gestión Clínica y de Personal:** Registro unificado donde cada paciente tiene su historial centralizado. Incluye un sistema de control de acceso estricto para que solo los empleados autorizados puedan operar la plataforma.
* **Agenda Inteligente:** Módulo de calendario interactivo para asignar, modificar y monitorear las citas del día, evitando conflictos de horarios en tiempo real.
* **Dashboard Analítico:** Panel de control principal que procesa las métricas operativas de la clínica al instante, ofreciendo un vistazo rápido al rendimiento diario y las alertas del sistema.

---

## ⚙️ Stack Tecnológico

<p align="left">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=php,laravel,tailwind,js,mysql,docker" alt="Tech Stack DentalSistem" />
  </a>
</p>

* **Core & Backend:** PHP, Laravel, Arquitectura MVC.
* **Frontend:** Blade Templates, Tailwind CSS, JavaScript.
* **Base de Datos:** MySQL.
* **DevOps & Entorno:** Docker.

---

> **Nota del Desarrollador:** Este proyecto fue estructurado con un enfoque "Enterprise-ready", demostrando el dominio del ciclo de vida del software: desde el levantamiento de requerimientos del modelo de datos clínico, hasta el empaquetado de la infraestructura en contenedores listos para ser desplegados en entornos de producción.
