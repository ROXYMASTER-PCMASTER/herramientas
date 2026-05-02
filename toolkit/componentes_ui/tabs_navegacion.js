// tabs_navegacion.js - sistema de pestanas con data-tab
// fuente: patron comun en dashboards vanilla js

class Tabs {
  constructor(contenedor) {
    this.contenedor = document.querySelector(contenedor);
    this.pestanas = this.contenedor.querySelectorAll("[data-tab]");
    this.contenidos = this.contenedor.querySelectorAll("[data-contenido]");
    this.pestanas.forEach(p => p.addEventListener("click", () => this.mostrar(p.dataset.tab)));
  }

  mostrar(tabId) {
    this.pestanas.forEach(p => p.classList.toggle("activo", p.dataset.tab === tabId));
    this.contenidos.forEach(c => c.style.display = c.dataset.contenido === tabId ? "block" : "none");
  }
}
