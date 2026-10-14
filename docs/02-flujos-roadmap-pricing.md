# Bloque 2: Flujo de Datos de los 8 Pilares, Roadmap y Pricing

## 4. Trazabilidad Extremo a Extremo entre los 8 Pilares
1. **Disparo Geo-Contextual (Pilares 7, 3 y 1):** Radiobases (LBS) detectan al abonado en zona comercial -> CRM valida afinidad -> Advertising envía oferta RCS desde el Número Único.
2. **Apertura y Conversión (Pilar 2):** Usuario responde -> Orquestador bloquea sesión en Redis -> Agente de Funnel consulta Qdrant y arma el carrito en el chat.
3. **Autenticación y Pago en 1 Clic (Pilares 6 y 5):** Telco-ID verifica en el HSS que no hubo SIM-Swap -> Telco-Pay ejecuta cobro por Pago Móvil C2P directo o billetera y concilia con el banco.
4. **Asiento Contable y Despacho (Pilares 4 y 7):** PostgreSQL descuenta stock en el ERP, emite factura digital y Logística asigna el motorizado más cercano según coordenadas LBS/GPS.
5. **Recompensa y Retención (Pilar 8):** El módulo Loyalty instruye al nodo PCRF/OCS de Movilnet para acreditar instantáneamente Megas de regalo al abonado.

## 5. Fases de Implementación (Roadmap 12 a 18 Meses)
* **Fase 1 (Meses 1-3) - Fundación y MVP:** Orquestador IA + Funnel (Pilar 2) + CRM (Pilar 3) + ERP Lite (Pilar 4) + Conciliación Pago Móvil C2P (Pilar 5) + Zero-Rating y Megas de Regalo.
* **Fase 2 (Meses 4-6) - Transaccionalidad Dura:** ERP Multi-tenant completo, conectores oficiales (Odoo/SAP) y motor de fidelización autoservicio (Pilar 8).
* **Fase 3 (Meses 7-9) - Escala Publicitaria y LBS:** Integración de radiobases en tiempo real (Pilar 7) y lanzamiento del Ad-Manager autogestionado (Pilar 1).
* **Fase 4 (Meses 10-12+) - Soberanía Financiera:** APIs bancarias de Telco-ID (Pilar 6) y microcréditos instantáneos basados en scoring de red (Pilar 5 Avanzado).

## 6. Esquema de Comisiones y Precios B2B
* **Suscripción SaaS:** Plan PyME ($0-$19/mes), Plan Crecimiento ($49-$149/mes), Plan Enterprise ($399+/mes).
* **Take-Rate Fintech:** 1.5% a 2.5% por venta cobrada y conciliada en el chat.
* **Conversaciones Entrantes (N <-> 1):** $0.00 (Gratis para el comercio).
* **Pauta Masiva (1 <-> N global):** $0.008 a $0.015 por mensaje enriquecido entregado.
* **Pauta Geo-Segmentada (LBS + IA):** $0.03 a $0.05 por impacto o modelo CPA.
* **Bolsas de Megas Patrocinados:** Paquetes mayoristas prepagados por los comercios (ej. $50 por 250 GB promocionales).
* **Validación Telco-ID:** $0.01 a $0.02 por verificación silenciosa de identidad bancaria.
