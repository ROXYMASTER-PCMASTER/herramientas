// modal_confirmacion.js - ventana modal de confirmacion si/no
// fuente: patron comun en dashboards vanilla js

function mostrarModal(titulo, texto, cbSi, cbNo) {
  var f = document.createElement("div");
  f.className = "modal-fondo";
  f.innerHTML = '<div class="modal-caja"><h3>' + titulo + '</h3><p>' + texto + '</p><div class="modal-botones"><button id="modal-si">si</button><button id="modal-no">no</button></div></div>';
  document.body.appendChild(f);
  document.getElementById("modal-si").onclick = function() { f.remove(); if (cbSi) cbSi(); };
  document.getElementById("modal-no").onclick = function() { f.remove(); if (cbNo) cbNo(); };
}

var stModal = document.createElement("style");
stModal.textContent = ".modal-fondo{position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.7);display:flex;align-items:center;justify-content:center;z-index:999}.modal-caja{background:#161b22;border:1px solid #30363d;border-radius:8px;padding:24px;max-width:400px;color:#c9d1d9}.modal-botones{display:flex;gap:8px;justify-content:flex-end;margin-top:16px}.modal-botones button{padding:6px 16px;border-radius:6px;border:1px solid #30363d;background:#21262d;color:#c9d1d9;cursor:pointer}";
document.head.appendChild(stModal);
