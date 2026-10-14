# Bloque 3: Ingeniería del Orquestador MCP y Plan Táctico MVP (90 Días)

## 7. Arquitectura del Bus MCP (Model Context Protocol) y Catálogo de Skills
Cada pilar actúa como un **Servidor MCP independiente** conectado por JSON-RPC/gRPC al Orquestador Central, el cual habilita las *Skills* según el plan SaaS del comercio:

* `mcp-telco-ads` (Pilar 1): `segmentar_audiencia_lbs()`, `disparar_broadcast_rcs()`
* `mcp-funnel-rag` (Pilar 2): `buscar_semantica_producto()`, `actualizar_carrito_sesion()`
* `mcp-crm-unified` (Pilar 3): `obtener_perfil_abonado()`, `escalar_a_humano()`
* `mcp-erp-core` (Pilar 4): `verificar_inventario()`, `reservar_item()`, `webhook_odoo()`
* `mcp-fintech-pay` (Pilar 5): `ejecutar_cobro_c2p()`, `conciliar_transaccion()`
* `mcp-telco-id` (Pilar 6): `validar_msisdn_activo()`, `chequear_sim_swap_reciente()`
* `mcp-logistics-lbs` (Pilar 7): `obtener_coordenadas_celda()`, `asignar_motorizado()`
* `mcp-telco-loyalty` (Pilar 8): `acreditar_megas_regalo()`, `sumar_movilpuntos()`

## 8. Plan Táctico de Ejecución del MVP (90 Días)
### Estrategia de "Doble Ancla"
1. **Ancla 1 (Tracción Interna):** Autogestión, consulta de saldo, compra de planes y recargas de **Movilnet** en el Número Único.
2. **Ancla 2 (Validación B2B):** 50 comercios piloto de alta frecuencia (farmacias, comida rápida, supermercados y tecnología).

### Cronograma de 12 Semanas
* **Semanas 1-3:** Configuración de Zero-Rating en PGW/GGSN, despliegue de PostgreSQL, Redis y Qdrant en contenedores, e integración con PCRF/OCS.
* **Semanas 4-6:** Desarrollo del Router Semántico, gestor de sesiones en Redis, primeros 4 servidores MCP (n8n Queue + Python FastAPI) y pasarela Pago Móvil C2P.
* **Semanas 7-9:** Lanzamiento del panel web multi-tenant, ingesta y vectorización de catálogos de las 50 empresas piloto y pruebas de estrés.
* **Semanas 10-12:** Encendido del Número Único para abonados Movilnet y primera campaña nacional con regalo de 200 MB por la primera compra en el chat.
