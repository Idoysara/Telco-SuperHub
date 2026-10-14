# Bloque 1: Cimientos Técnicos, Modelo B2B y Canal de Entrega

## 1. Arquitectura del Orquestador de IA y Bases de Datos (N <-> 1)
1. **API Gateway & Ingesta Asíncrona (Kafka / RabbitMQ):** Recibe el mensaje del usuario junto con la metadata de red (MSISDN, ID de Celda LBS, validación SIM).
2. **Gestor de Estado Ultrarrápido (Redis Cluster):** Verifica en menos de 2 ms si el abonado tiene una sesión activa con un comercio (*Context Lock*).
3. **Router Semántico (SLM):** Si no hay sesión bloqueada o hay cambio de intención, clasifica la solicitud en menos de 100 ms e invoca al sub-agente correspondiente.
4. **Enjambre de Sub-Agentes Especializados (Multi-Tenant):** Agentes de Ventas/Funnel, ERP/Fintech, CRM/Soporte y Telco/Loyalty.
* **Hilos Virtuales de Sesión (Session Tunnels):** Apila sesiones en Redis (`session_tunnel_stack`) para resolver consultas paralelas sin perder el carrito de compras activo.

### Tríada de Persistencia
* **Memoria Caliente (Redis Enterprise / KeyDB):** Estado exacto de la conversación, paso del funnel y carrito activo.
* **Motor Transaccional (PostgreSQL Distribuido / Citus):** Almacenamiento auditable y relacional para ERP, CRM, Ledger Fintech y aislamiento Multi-Tenant.
* **Memoria Semántica y Catálogos (Qdrant):** Vectores (embeddings) de productos, reglas de negocio e historial semántico para RAG en tiempo real.

## 2. Modelo de Negocio B2B para Empresas y Anunciantes
1. **Suscripción SaaS Multi-Pilar:** Tier PyME (Todo-en-uno web) y Tier Corporativo/Enterprise (Integración Webhook con Odoo, SAP, Profit, Galac + Telco-ID).
2. **Telco-Ad Network:** Campañas Geo-Cercadas (*Geo-Fencing* LBS) cobradas por CPM y CPC/CPL.
3. **Megas Patrocinados (Data-Rewards B2B2C):** Bolsas mayoristas de datos compradas por los comercios para premiar con Megas gratis a los usuarios que compren en su Funnel.
4. **Monetización de APIs de Red (Open Gateway / Telco-ID):** Cobro por llamada API a bancos y aseguradoras por validación silenciosa de identidad SIM.

## 3. Estrategia del Canal de Entrega: Arquitectura Híbrida (Omni-Endpoint)
* **Canal de Ataque Masivo (RCS Nativo):** Cero fricción de descarga. Llega directo a la bandeja de Mensajes de Android con carruseles interactivos y botones.
* **Canal de Profundidad Transaccional (PWA / App Propia con Zero-Rating):** Se abre desde el chat RCS sin consumir datos para gestionar billeteras visuales (Telco-Pay), mapas de delivery y lealtad.
