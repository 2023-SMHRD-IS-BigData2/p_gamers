var join = document.getElementById("join")
var login = document.getElementById("login")
var inner = document.getElementById("inner")
var btnLogin = document.getElementById("btn-login")
btnLogin.addEventListener("click", e => {
	login.style.display = "flex"
	inner.style.display = "none"
	join.style.display = "none"
})
let closeLogin = login.querySelector(".close-login")
closeLogin.addEventListener("click", e => {
	login.style.display = "none"
	join.style.display = "none"
	inner.style.display = "inline"
})
login.addEventListener("click", e => {
	var evTarget = e.target
	if (evTarget.classList.contains("login-overlay")) {
		login.style.display = "none"
		join.style.display = "none"
		inner.style.display = "inline"
	}
})