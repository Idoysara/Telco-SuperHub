# Telco-SuperHub: Infraestructura Soberana RCS & Comercio Conversacional (N <-> 1)

Arquitectura conceptual, técnica y de negocio para el despliegue de una plataforma soberana *Carrier-Grade* de Comercio Conversacional, ERP, CRM, Fintech y Advertising impulsada por Agentes de IA y el protocolo **MCP (Model Context Protocol)** operando directamente en el *Core* de **Movilnet**.

## Visión General y Topología de Red
El modelo transforma a la operadora en el **Sistema Operativo Comercial del País** mediante un **Único Número Maestro** con tráfico *Zero-Rating* (libre de consumo de datos en los nodos GGSN/PGW).

* **Flujo Entrante Concentrado ($N \leftrightarrow 1$):** Millones de abonados escriben a un único número. El Orquestador Semántico identifica al usuario por su SIM (MSISDN) y enruta la sesión al comercio o servicio correspondiente.
* **Flujo Saliente Global ($1 \leftrightarrow N_{\text{global}}$):** Difusión masiva (*Broadcasting*) sobre canal híbrido RCS Nativo + PWA sin bloqueos ni costos por ventana de Meta.
* **Flujo Saliente Quirúrgico ($1 \leftrightarrow \text{Usuario}$):** Disparadores automáticos 1-a-1 generados por eventos del ERP (facturas), CRM (carritos abandonados) o LBS (cercanía geográfica a tiendas).

## Arquitectura de los 8 Pilares
| Bloque | Pilar | Servidor MCP | Función Principal |
| :--- | :--- | :--- | :--- |
| **Front-Office** | **1. Advertising (Telco-Ads)** | `mcp-telco-ads` | Pauta hiper-segmentada por radiobases (LBS) y perfil de red. |
| **Front-Office** | **2. Funnel Marketing** | `mcp-funnel-rag` | Embudos conversacionales autónomos con búsqueda vectorial en catálogos. |
| **Front-Office** | **3. CRM Unificado** | `mcp-crm-unified` | Memoria a largo plazo, perfilamiento por MSISDN y soporte post-venta. |
| **Front-Office** | **8. Loyalty & Gamificación** | `mcp-telco-loyalty` | Recompensas inmediatas en Megas libres (PCRF/OCS) por compras completadas. |
| **Back-Office & Core** | **4. ERP Transaccional** | `mcp-erp-core` | Control de stock ACID, facturación multi-tenant y conectores Webhook (Odoo/SAP). |
| **Back-Office & Core** | **5. Fintech (Telco-Pay)** | `mcp-fintech-pay` | Pago Móvil C2P en 1 clic, billetera, cobro contra saldo y conciliación al vuelo. |
| **Back-Office & Core** | **6. Identidad (Telco-ID)** | `mcp-telco-id` | Autenticación silenciosa en HSS/UDM y detección de SIM-Swap sin SMS OTP. |
| **Back-Office & Core** | **7. Logística y LBS** | `mcp-logistics-lbs` | Posicionamiento por celdas celulares/GPS y ruteo de última milla. |

## Estructura del Repositorio
* [`docs/01-arquitectura-negocio-canales.md`](docs/01-arquitectura-negocio-canales.md): Bloque 1 (Orquestador, Tríada de BD, Modelo B2B y Comparativa RCS vs App).
* [`docs/02-flujos-roadmap-pricing.md`](docs/02-flujos-roadmap-pricing.md): Bloque 2 (Trazabilidad de los 8 Pilares, Roadmap 12 meses y Esquema de Precios/Comisiones).
* [`docs/03-orquestador-mcp-mvp90d.md`](docs/03-orquestador-mcp-mvp90d.md): Bloque 3 (Ingeniería del Bus MCP, Catálogo de Skills, Multi-tenancy y Plan Táctico MVP 90 días).
* [`mcp-servers/skills-manifest.json`](mcp-servers/skills-manifest.json): Definición JSON de las herramientas (*Skills*) expuestas al Orquestador de IA.
* [`database/schema-multitenant.sql`](database/schema-multitenant.sql): Esquema PostgreSQL con Row-Level Security (RLS) para aislamiento de empresas.
* [`database/redis-qdrant-specs.json`](database/redis-qdrant-specs.json): Estructura de sesiones en Redis (*Session Tunnels*) y payload vectorial en Qdrant.
* [`deploy/docker-compose.mvp.yml`](deploy/docker-compose.mvp.yml): Stack base de contenedores para el despliegue del MVP en el Data Center.
