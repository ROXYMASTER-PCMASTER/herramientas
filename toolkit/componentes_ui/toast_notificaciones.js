// toast_notificaciones.js - notificaciones emergentes vanilla js
// fuente: adaptado de patrones de dashboards

function mostrarToast(mensaje, tipo) {
  tipo = tipo || "info";
  var t = document.createElement("div");
  t.className = "toast toast-" + tipo;
  t.textContent = mensaje;
  document.body.appendChild(t);
  setTimeout(function() { t.remove(); }, 3000);
}

var stToast = document.createElement("style");
stToast.textContent = ".toast{position:fixed;bottom:20px;right:20px;padding:12px 20px;border-radius:6px;color:#fff;z-index:9999;animation:toast-in 0.3s}.toast-info{background:#58a6ff}.toast-error{background:#da3633}.toast-success{background:#3fb950}@keyframes toast-in{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}}";
document.head.appendChild(stToast);
